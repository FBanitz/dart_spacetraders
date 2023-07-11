import 'package:dart_spacetraders/src/spacetraders_client.dart';
import 'package:test/test.dart';
import 'package:dart_spacetraders/src/services/game.dart';

class _MockSpaceTradersClient implements ISpaceTradersClient {
  @override
  Future<Map<String, dynamic>> get(String path) async {
    return {
      'status': 'spacetraders is currently online and available to play',
    };
  }

  @override
  Future<Map<String, dynamic>> post(String path,
      {Map<String, dynamic>? body}) async {
    return {};
  }

  @override
  void setToken(String token) {}
}

void main() {
  final client = _MockSpaceTradersClient();
  final game = GameService(client);
  group('Game', () {
    test('status', () async {
      final status = await game.status();
      expect(status, true);
    });
    test('statusMessage', () async {
      final statusMessage = await game.statusMessage();
      expect(statusMessage,
          'spacetraders is currently online and available to play');
    });
  });
}
