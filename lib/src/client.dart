import 'dart:convert';

import 'package:http/http.dart' as http;

/// The base URL for the SpaceTraders API.
const String _kBaseUrl = 'https://api.spacetraders.io';

/// The header name for the token.
const String _kTokenHeader = 'Authorization';

/// The prefix for the token.
const String _kTokenPrefix = 'Bearer ';

/// The key for the error response.
const String _kResponseErrorKey = 'error';

/// The key for the error message.
const String _kResponseErrorMessageKey = 'message';

abstract class ISpaceTradersClient {
  ISpaceTradersClient([this.token]);

  /// The token to use for requests.
  /// You can get a token by calling `claim` on the `AccountService`.
  String? token;

  /// http `GET` call to the SpaceTraders API.
  Future<Map<String, dynamic>> get(
    /// The path to call.
    String path,
  );

  /// http `POST` call to the SpaceTraders API.
  Future<Map<String, dynamic>> post(
    /// The path to call.
    String path, {
    /// The body to send.
    Map<String, dynamic>? body,
  });
}

/// A client for the SpaceTraders API.
class SpaceTradersClient extends ISpaceTradersClient {
  /// Creates a new client.
  SpaceTradersClient([super.token]);

  /// http `GET` call to the SpaceTraders API.
  @override
  Future<Map<String, dynamic>> get(
    /// The path to call.
    String path,
  ) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers[_kTokenHeader] = '$_kTokenPrefix$token';
    }

    final Uri uri = Uri.parse('$_kBaseUrl$path');

    final response = await http.get(
      uri,
      headers: headers,
    );

    Map<String, dynamic> responseBody = jsonDecode(response.body);

    if (responseBody[_kResponseErrorKey] != null) {
      throw Exception(
          responseBody[_kResponseErrorKey][_kResponseErrorMessageKey]);
    }

    return responseBody;
  }

  @override
  Future<Map<String, dynamic>> post(
    /// The path to call.
    String path, {
    /// The body to send.
    Map<String, dynamic>? body,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers[_kTokenHeader] = '$_kTokenPrefix$token';
    }

    final response = await http.post(
      Uri.parse('$_kBaseUrl$path'),
      headers: headers,
      body: jsonEncode(body),
    );

    Map<String, dynamic> responseBody = jsonDecode(response.body);

    if (responseBody[_kResponseErrorKey] != null) {
      throw Exception(
        responseBody[_kResponseErrorKey][_kResponseErrorMessageKey],
      );
    }

    return responseBody;
  }
}
