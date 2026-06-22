import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:google_generative_ai/google_generative_ai.dart';

import '../config/app_env.dart';
import '../errors/ai_exception.dart';
import 'package:flutter/material.dart';

import '../ai/prompts/chat_prompt.dart';
import 'parsers/json_response_parser.dart';

export '../errors/ai_exception.dart';

/// Low-level Gemini API client with retries, timeout, and model fallback.
class GeminiClient {
  GeminiClient._();
  static final GeminiClient instance = GeminiClient._();

  static const Duration _timeout = Duration(seconds: 60);
  static const int _maxRetries = 2;

  void _ensureApiKey() {
    if (!AppEnv.hasGeminiKey) throw const AiMissingApiKeyException();
  }

  Future<String> generateJson({
    required String prompt,
    double temperature = 0.4,
  }) async {
    _ensureApiKey();
    Object? lastError;

    for (final String modelName in AppEnv.geminiModels) {
      for (int attempt = 0; attempt <= _maxRetries; attempt++) {
        try {
          final GenerativeModel model = GenerativeModel(
            model: modelName,
            apiKey: AppEnv.geminiApiKey,
            generationConfig: GenerationConfig(
              responseMimeType: 'application/json',
              temperature: temperature,
            ),
          );
          final GenerateContentResponse response = await model
              .generateContent(<Content>[Content.text(prompt)])
              .timeout(_timeout);
          final String? raw = response.text?.trim();
          if (raw == null || raw.isEmpty) {
            throw const AiEmptyResponseException();
          }
          JsonResponseParser.parseObject(raw);
          return raw;
        } on TimeoutException {
          lastError = const AiTimeoutException();
          if (attempt < _maxRetries) continue;
        } catch (e) {
          lastError = e;
          if (_isInvalidApiKey(e)) throw const AiMissingApiKeyException();
          if (_shouldTryNextModel(e)) break;
          if (_isRateLimited(e)) throw const AiRateLimitException();
          if (_isNetworkError(e)) throw AiNetworkException(e.toString());
          if (attempt < _maxRetries && _isRetryable(e)) continue;
          throw _wrap(e);
        }
      }
    }
    throw _wrap(lastError ?? 'All Gemini models failed.');
  }

  Future<String> chat({
    required String userMessage,
    required List<({bool isUser, String text})> priorMessages,
    required Locale locale,
    String? attachedImagePath,
  }) async {
    _ensureApiKey();
    final List<Content> history = priorMessages
        .map(
          (({bool isUser, String text}) m) => m.isUser
              ? Content.text(m.text)
              : Content.model(<Part>[TextPart(m.text)]),
        )
        .toList();

    Object? lastError;
    for (final String modelName in AppEnv.geminiModels) {
      try {
        final GenerativeModel model = GenerativeModel(
          model: modelName,
          apiKey: AppEnv.geminiApiKey,
          systemInstruction:
              Content.system(ChatPrompt.systemInstruction(locale: locale)),
        );
        final ChatSession session = model.startChat(history: history);
        
        final List<Part> parts = <Part>[TextPart(userMessage)];
        if (attachedImagePath != null) {
          final File file = File(attachedImagePath);
          if (await file.exists()) {
            final Uint8List bytes = await file.readAsBytes();
            final String mimeType = attachedImagePath.toLowerCase().endsWith('.png')
                ? 'image/png'
                : 'image/jpeg';
            parts.add(DataPart(mimeType, bytes));
          }
        }

        final GenerateContentResponse response = await session
            .sendMessage(Content('user', parts))
            .timeout(_timeout);
        final String? text = response.text?.trim();
        if (text == null || text.isEmpty) {
          throw const AiEmptyResponseException();
        }
        return text;
      } catch (e) {
        lastError = e;
        if (_isInvalidApiKey(e)) throw const AiMissingApiKeyException();
        if (_shouldTryNextModel(e)) continue;
        if (_isRateLimited(e)) throw const AiRateLimitException();
        if (_isNetworkError(e)) throw AiNetworkException(e.toString());
        throw _wrap(e);
      }
    }
    throw _wrap(lastError ?? 'Chat failed on all models.');
  }

  Stream<String> chatStream({
    required String userMessage,
    required List<({bool isUser, String text})> priorMessages,
    required Locale locale,
  }) async* {
    _ensureApiKey();
    final List<Content> history = priorMessages
        .map(
          (({bool isUser, String text}) m) => m.isUser
              ? Content.text(m.text)
              : Content.model(<Part>[TextPart(m.text)]),
        )
        .toList();

    for (final String modelName in AppEnv.geminiModels) {
      try {
        final GenerativeModel model = GenerativeModel(
          model: modelName,
          apiKey: AppEnv.geminiApiKey,
          systemInstruction:
              Content.system(ChatPrompt.systemInstruction(locale: locale)),
        );
        final ChatSession session = model.startChat(history: history);
        final Stream<GenerateContentResponse> stream =
            session.sendMessageStream(Content.text(userMessage));
        await for (final GenerateContentResponse chunk in stream) {
          final String? text = chunk.text;
          if (text != null && text.isNotEmpty) yield text;
        }
        return;
      } catch (e) {
        if (_shouldTryNextModel(e)) continue;
        throw _wrap(e);
      }
    }
    throw const AiUnknownException('Streaming unavailable.');
  }

  bool _isInvalidApiKey(Object error) {
    final String msg = error.toString().toLowerCase();
    return msg.contains('api key not valid') ||
        msg.contains('api_key_invalid') ||
        msg.contains('invalid api key') ||
        msg.contains('permission denied') ||
        msg.contains('unregistered callers') ||
        (msg.contains('401') && msg.contains('api')) ||
        (msg.contains('403') && msg.contains('api'));
  }

  bool _shouldTryNextModel(Object error) {
    final String msg = error.toString().toLowerCase();
    return msg.contains('not found') ||
        msg.contains('no longer available') ||
        msg.contains('404');
  }

  bool _isRateLimited(Object error) {
    final String msg = error.toString().toLowerCase();
    return msg.contains('429') || msg.contains('rate');
  }

  bool _isNetworkError(Object error) {
    final String msg = error.toString().toLowerCase();
    return msg.contains('socket') ||
        msg.contains('network') ||
        msg.contains('connection');
  }

  bool _isRetryable(Object error) =>
      _isNetworkError(error) || error is TimeoutException;

  AiException _wrap(Object error) {
    if (error is AiException) return error;
    if (error is GenerativeAIException) {
      return AiUnknownException(error.message);
    }
    return AiUnknownException(error);
  }
}
