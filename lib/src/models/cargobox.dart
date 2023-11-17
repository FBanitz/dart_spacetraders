import 'package:dart_spacetraders/src/models/good.dart';

abstract class CargoBoxSchema {
  static const String tableName = 'cargoBoxes';

  static const String goodKey = 'good';
  static const String quantityKey = 'quantity';
  static const String totalVolumeKey = 'totalVolume';
}

class CargoBox extends Good {
  final int quantity;
  final int totalVolume;

  CargoBox({
    required super.symbol,
    required this.quantity,
    required this.totalVolume,
  });

  factory CargoBox.fromJson(Map<String, dynamic> json) {
    return CargoBox(
      symbol: json[CargoBoxSchema.goodKey],
      quantity: json[CargoBoxSchema.quantityKey],
      totalVolume: json[CargoBoxSchema.totalVolumeKey],
    );
  }
}
