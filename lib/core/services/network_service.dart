import 'dart:convert';

import 'package:http/http.dart' as http;

/// A lightweight HTTP wrapper to centralize API requests.
///
/// The `post` method is ready to be plugged into a real backend endpoint.
class NetworkService {
  NetworkService._();
  static final NetworkService instance = NetworkService._();

  Future<http.Response> post(String path, Map<String, dynamic> body) async {
    final Uri uri = Uri.parse('https://api.example.com/$path');
    return http.post(
      uri,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
  }
}
