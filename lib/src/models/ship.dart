import 'package:dart_spacetraders/src/models/cargobox.dart';
import 'package:dart_spacetraders/src/tools/serialization.dart';

abstract class ShipSchema {
  static const String tableName = 'ships';
  static const String cargoKey = 'cargo';
  static const String classKey = 'class';
  static const String flightPlanIdKey = 'flightPlanId';
  static const String idKey = 'id';
  static const String locationKey = 'location';
  static const String manufacturerKey = 'manufacturer';
  static const String maxCargoKey = 'maxCargo';
  static const String platingKey = 'plating';
  static const String spaceAvailableKey = 'spaceAvailable';
  static const String speedKey = 'speed';
  static const String typeKey = 'type';
  static const String weaponsKey = 'weapons';
  static const String xKey = 'x';
  static const String yKey = 'y';
}

class Ship {
  final List<CargoBox>? cargo;
  final String? shipClass;
  final String? flightPlanId;
  final String? id;
  final String? location;
  final String? manufacturer;
  final int? maxCargo;
  final int? plating;
  final int? spaceAvailable;
  final int? speed;
  final String? type;
  final int? weapons;
  final int? x;
  final int? y;

  Ship({
    this.cargo,
    this.shipClass,
    this.flightPlanId,
    this.id,
    this.location,
    this.manufacturer,
    this.maxCargo,
    this.plating,
    this.spaceAvailable,
    this.speed,
    this.type,
    this.weapons,
    this.x,
    this.y,
  });

  factory Ship.fromJson(Map<String, dynamic> json) {
    List jsonCargo = typeCheck<List>(json[ShipSchema.cargoKey]);

    List<CargoBox> cargo = jsonCargo.map((e) {
      Map<String, dynamic> cargoBoxJson = typeCheck<Map<String, dynamic>>(e);
      return CargoBox.fromJson(cargoBoxJson);
    }).toList();

    return Ship(
      cargo: cargo,
      shipClass: typeCheck<String>(json[ShipSchema.classKey]),
      flightPlanId: typeCheck<String>(json[ShipSchema.flightPlanIdKey]),
      id: typeCheck<String>(json[ShipSchema.idKey]),
      location: typeCheck<String>(json[ShipSchema.locationKey]),
      manufacturer: typeCheck<String>(json[ShipSchema.manufacturerKey]),
      maxCargo: typeCheck<int>(json[ShipSchema.maxCargoKey]),
      plating: typeCheck<int>(json[ShipSchema.platingKey]),
      spaceAvailable: typeCheck<int>(json[ShipSchema.spaceAvailableKey]),
      speed: typeCheck<int>(json[ShipSchema.speedKey]),
      type: typeCheck<String>(json[ShipSchema.typeKey]),
      weapons: typeCheck<int>(json[ShipSchema.weaponsKey]),
      x: typeCheck<int>(json[ShipSchema.xKey]),
      y: typeCheck<int>(json[ShipSchema.yKey]),
    );
  }
}
