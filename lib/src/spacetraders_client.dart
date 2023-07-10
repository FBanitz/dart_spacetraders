import 'dart:convert';

import 'package:http/http.dart' as http;

/// The base URL for the SpaceTraders API.
const String _kBaseUrl = 'https://api.spacetraders.io';

/// The header name for the token.
const String _kTokenHeader = 'Authorization';

/// The prefix for the token.
const String _kTokenPrefix = 'Bearer ';

/// A client for the SpaceTraders API.
class SpaceTradersClient {
  /// The token for the client.
  String? _token;

  /// Creates a new client.
  SpaceTradersClient([this._token]);

  /// Sets the token for the client.
  void setToken(String token) {
    _token = token;
  }

  /// http `GET` call to the SpaceTraders API.
  Future<Map<String, dynamic>> get(
    /// The path to call.
    String path,
  ) async {
    Map<String, String> headers = {};
    if (_token != null) {
      headers[_kTokenHeader] = '$_kTokenPrefix$_token';
    }

    final response = await http.get(
      Uri.parse('$_kBaseUrl$path'),
      headers: headers,
    );

    return jsonDecode(response.body);
  }

  /// http `POST` call to the SpaceTraders API.
  Future<Map<String, dynamic>> post(
    /// The path to call.
    String path, {
    /// The body to send.
    Map<String, dynamic>? body,
  }) async {
    Map<String, String> headers = {};
    if (_token != null) {
      headers[_kTokenHeader] = '$_kTokenPrefix$_token';
    }

    final response = await http.post(
      Uri.parse('$_kBaseUrl$path'),
      headers: headers,
      body: jsonEncode(body),
    );

    return jsonDecode(response.body);
  }
}
