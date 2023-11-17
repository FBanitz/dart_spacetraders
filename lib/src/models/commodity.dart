import 'package:dart_spacetraders/src/models/good.dart';

/// A schema for the commodity table in the API.
/// Used to avoid typos when accessing the API.
abstract class CommoditySchema {
  /// The name of the table in the API.
  static const String tableName = 'commodities';

  /// The key for the symbol column in the table.
  static const String symbolKey = 'symbol';

  /// The key for the volumePerUnit column in the table.
  static const String volumePerUnitKey = 'volumePerUnit';

  /// The key for the pricePerUnit column in the table.
  static const String pricePerUnitKey = 'pricePerUnit';

  /// The key for the spread column in the table.
  static const String spreadKey = 'spread';

  /// The key for the purchasePricePerUnit column in the table.
  static const String purchasePricePerUnitKey = 'purchasePricePerUnit';

  /// The key for the sellPricePerUnit column in the table.
  static const String sellPricePerUnitKey = 'sellPricePerUnit';

  /// The key for the quantityAvailable column in the table.
  static const String quantityAvailableKey = 'quantityAvailable';
}

/// A commodity in a [Marketplace].
class Commodity extends Good {
  /// The volume per unit of the commodity.
  /// The volume is the amount of space the commodity takes up in a cargo box.
  final int volumePerUnit;

  /// The price per unit of the commodity.
  final int pricePerUnit;

  /// The spread of the commodity.
  /// The spread is the difference between the lowest sell price and the highest purchase price.
  final int spread;

  /// The purchase price per unit of the commodity.
  final int purchasePricePerUnit;

  /// The sell price per unit of the commodity.
  final int sellPricePerUnit;

  /// The total quantity available of the commodity.
  final int quantityAvailable;

  /// Creates a new commodity.
  Commodity({
    required super.symbol,
    required this.volumePerUnit,
    required this.pricePerUnit,
    required this.spread,
    required this.purchasePricePerUnit,
    required this.sellPricePerUnit,
    required this.quantityAvailable,
  });

  /// Creates a new commodity from a JSON object.
  factory Commodity.fromJson(Map<String, dynamic> json) {
    return Commodity(
      symbol: json[CommoditySchema.symbolKey],
      volumePerUnit: json[CommoditySchema.volumePerUnitKey],
      pricePerUnit: json[CommoditySchema.pricePerUnitKey],
      spread: json[CommoditySchema.spreadKey],
      purchasePricePerUnit: json[CommoditySchema.purchasePricePerUnitKey],
      sellPricePerUnit: json[CommoditySchema.sellPricePerUnitKey],
      quantityAvailable: json[CommoditySchema.quantityAvailableKey],
    );
  }
}
