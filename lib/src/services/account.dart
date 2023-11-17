import 'package:dart_spacetraders/dart_spacetraders.dart';

const String _kUsersPath = '/users';

String _claimPath(String username) => '$_kUsersPath/$username/claim';

const String _kMyAccountPath = '/my/account';

class AccountService {
  final ISpaceTradersClient _client;

  AccountService(this._client);

  Future<User> claim(String username) async {
    final Map<String, dynamic> response = await _client.post(
      _claimPath(username),
    );

    final String? token = response[UserSchema.token];

    if (token == null) {
      throw Exception('Expected token in response');
    }

    _client.token = token;

    return User.fromJson(response[UserSchema.tableName]);
  }

  Future<User> myAccount() async {
    final Map<String, dynamic> response = await _client.get(_kMyAccountPath);
    return User.fromJson(response[UserSchema.tableName]);
  }
}
