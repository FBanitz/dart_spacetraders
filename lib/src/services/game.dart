import 'package:dart_spacetraders/src/client.dart';

/// The path for the game endpoints
const String _kGamePath = '/game';

/// The path for the status endpoint
const String _kStatusPath = '$_kGamePath/status';

const String _kStatusMessageKey = 'status';

/// Used to determine whether the server is alive
class GameService {
  final ISpaceTradersClient _client;

  GameService(this._client);

  /// Returns whether the server is alive
  Future<bool> status() async {
    try {
      await _client.get(_kStatusPath);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Returns the status message from the server
  Future<String?> statusMessage() async {
    try {
      final response = await _client.get(_kStatusPath);
      return response[_kStatusMessageKey];
    } catch (_) {
      return null;
    }
  }
}
