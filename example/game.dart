import 'package:dart_spacetraders/src/services/game.dart';
import 'package:dart_spacetraders/src/spacetraders_client.dart';

void main() async {
  final client = SpaceTradersClient();
  final game = Game(client);

  final status = await game.status();
  print('Spacetraders server is alive: $status');

  final statusMessage = await game.statusMessage();
  print('Spacetraders status message: $statusMessage');
}
