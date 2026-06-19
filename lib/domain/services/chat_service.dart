import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

import '../../core/ai/gemini_client.dart';
import '../../data/local/local_database.dart';
import '../../data/models/chat/chat_session.dart';
import '../../data/repositories/app_repositories.dart';

class ChatService {
  ChatService({
    GeminiClient? client,
    ChatRepository? repository,
  })  : _client = client ?? GeminiClient.instance,
        _repository = repository ?? ChatRepository(LocalDatabase.instance);

  final GeminiClient _client;
  final ChatRepository _repository;
  final Uuid _uuid = const Uuid();

  List<ChatSessionModel> allSessions() => _repository.getAll();

  ChatSessionModel? session(String id) => _repository.getById(id);

  Future<ChatSessionModel> sendMessage({
    required String text,
    String? sessionId,
    required Locale locale,
  }) async {
    ChatSessionModel session = sessionId != null
        ? _repository.getById(sessionId) ??
            _newSession(title: _titleFromMessage(text))
        : _newSession(title: _titleFromMessage(text));

    final ChatMessageModel userMessage = ChatMessageModel(
      id: _uuid.v4(),
      text: text.trim(),
      isUser: true,
      timestamp: DateTime.now(),
    );

    final List<ChatMessageModel> updatedMessages =
        List<ChatMessageModel>.from(session.messages)..add(userMessage);

    final List<({bool isUser, String text})> prior = updatedMessages
        .sublist(0, updatedMessages.length - 1)
        .map((ChatMessageModel m) => (isUser: m.isUser, text: m.text))
        .toList();

    final String reply = await _client.chat(
      userMessage: userMessage.text,
      priorMessages: prior,
      locale: locale,
    );

    final ChatMessageModel aiMessage = ChatMessageModel(
      id: _uuid.v4(),
      text: reply,
      isUser: false,
      timestamp: DateTime.now(),
    );

    session = session.copyWith(
      messages: <ChatMessageModel>[...updatedMessages, aiMessage],
      updatedAt: DateTime.now(),
    );
    await _repository.save(session);
    return session;
  }

  Stream<String> sendMessageStream({
    required String text,
    required ChatSessionModel session,
    required Locale locale,
  }) async* {
    final ChatMessageModel userMessage = ChatMessageModel(
      id: _uuid.v4(),
      text: text.trim(),
      isUser: true,
      timestamp: DateTime.now(),
    );
    final List<ChatMessageModel> withUser =
        List<ChatMessageModel>.from(session.messages)..add(userMessage);
    final List<({bool isUser, String text})> prior = withUser
        .sublist(0, withUser.length - 1)
        .map((ChatMessageModel m) => (isUser: m.isUser, text: m.text))
        .toList();

    yield* _client.chatStream(
      userMessage: userMessage.text,
      priorMessages: prior,
      locale: locale,
    );
  }

  Future<void> deleteSession(String id) => _repository.delete(id);

  Future<void> deleteAllSessions() => _repository.deleteAll();

  ChatSessionModel _newSession({required String title}) {
    final DateTime now = DateTime.now();
    return ChatSessionModel(
      id: _uuid.v4(),
      title: title,
      messages: const <ChatMessageModel>[],
      createdAt: now,
      updatedAt: now,
    );
  }

  String _titleFromMessage(String text) {
    final String trimmed = text.trim();
    if (trimmed.length <= 32) return trimmed;
    return '${trimmed.substring(0, 29)}...';
  }
}
