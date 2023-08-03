class UserSchema {
  static const String table = 'user';
  static const String token = 'token';
  static const String username = 'username';
  static const String credits = 'credits';
  static const String ships = 'ships';
  static const String shipCount = 'shipCount';
  static const String structureCount = 'structureCount';
  static const String joinedAt = 'joinedAt';
}

class User {
  final String username;
  final int credits;
  final int? shipCount;
  final int? structureCount;
  final DateTime? joinedAt;

  User({
    required this.username,
    required this.credits,
    this.shipCount,
    this.structureCount,
    required this.joinedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final dynamic username = json[UserSchema.username];
    final dynamic credits = json[UserSchema.credits];
    final dynamic ships = json[UserSchema.ships];
    final dynamic shipCount = json[UserSchema.shipCount];
    final dynamic structureCount = json[UserSchema.structureCount];
    final dynamic joinedAt = json[UserSchema.joinedAt];

    if (username is! String) {
      throw Exception('Expected String for username type');
    }

    if (credits is! int) {
      throw Exception('Expected int for credits type');
    }

    if (ships is! List?) {
      throw Exception('Expected List for ships type');
    }

    if (shipCount is! int?) {
      throw Exception('Expected int for shipCount type');
    }

    if (structureCount is! int?) {
      throw Exception('Expected int for structureCount type');
    }

    if (joinedAt is! String?) {
      throw Exception('Expected String for joinedAt type');
    }

    return User(
      username: username,
      credits: credits,
      shipCount: shipCount ?? ships?.length,
      structureCount: structureCount,
      joinedAt:
          joinedAt == null ? null : DateTime.tryParse(joinedAt)?.toLocal(),
    );
  }

  @override
  String toString() {
    return 'User('
        'username: $username, '
        'credits: $credits, '
        'shipCount: $shipCount, '
        'structureCount: $structureCount, '
        'joinedAt: $joinedAt'
        ')';
  }
}
