import 'package:dart_spacetraders/dart_spacetraders.dart';

main() {
  final SpaceTradersClient client = SpaceTradersClient('your-token');
  final AccountService account = AccountService(client);

  account.myAccount().then((value) => print(value));
}
