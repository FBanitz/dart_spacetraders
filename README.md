<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

<!--
TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.
-->

# Dart Spacetraders
A Dart client package for the [SpaceTraders'](https://spacetraders.io/) API

## Features ✨

### Account managment
- claim account
- get account informations

### Game status
- get server status

## Usage
[Examples](./example)

### Acount
```dart
  final SpaceTradersClient client = SpaceTradersClient('your-token');
  final AccountService account = AccountService(client);

  print(await account.myAccount());
```

### Server status
```dart
  final client = SpaceTradersClient();
  final game = GameService(client);

  final status = await game.status();
  print('Spacetraders server is alive: $status');

  final statusMessage = await game.statusMessage();
  print('Spacetraders status message: $statusMessage');
```
