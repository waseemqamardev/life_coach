import 'dart:convert';

import '../../errors/ai_exception.dart';

class JsonResponseParser {
  JsonResponseParser._();

  static Map<String, dynamic> parseObject(String raw) {
    String text = raw.trim();
    if (text.isEmpty) {
      throw const AiEmptyResponseException();
    }
    if (text.startsWith('```')) {
      text = text.replaceFirst(RegExp(r'^```(?:json)?\s*'), '');
      text = text.replaceFirst(RegExp(r'\s*```$'), '');
    }
    try {
      final dynamic decoded = jsonDecode(text);
      if (decoded is Map<String, dynamic>) return decoded;
      if (decoded is Map) {
        return decoded.map(
          (dynamic k, dynamic v) => MapEntry(k.toString(), v),
        );
      }
    } on FormatException {
      throw const AiParseException();
    }
    throw const AiParseException('Unexpected JSON structure.');
  }
}
