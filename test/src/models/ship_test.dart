import 'package:test/test.dart';
import 'package:dart_spacetraders/src/models/ship.dart';

void main() {
  group('Ship', () {
    test('fromJson', () {
      const json = {
        ShipSchema.cargoKey: [],
        ShipSchema.classKey: 'MK-I',
        ShipSchema.flightPlanIdKey: 'ckon8lk9m005354nz12qjbucx',
        ShipSchema.idKey: 'ckon84fo20196vinzktdlvdlv',
        ShipSchema.locationKey: 'OE-PM-TR',
        ShipSchema.manufacturerKey: 'Jackshaw',
        ShipSchema.maxCargoKey: 50,
        ShipSchema.platingKey: 5,
        ShipSchema.spaceAvailableKey: 32,
        ShipSchema.speedKey: 1,
        ShipSchema.typeKey: 'JW-MK-I',
        ShipSchema.weaponsKey: 5,
        ShipSchema.xKey: 21,
        ShipSchema.yKey: -24,
      };

      final model = Ship.fromJson(json);

      expect(model.cargo, json[ShipSchema.cargoKey]);
      expect(model.shipClass, json[ShipSchema.classKey]);
      expect(model.flightPlanId, json[ShipSchema.flightPlanIdKey]);
      expect(model.id, json[ShipSchema.idKey]);
      expect(model.location, json[ShipSchema.locationKey]);
      expect(model.manufacturer, json[ShipSchema.manufacturerKey]);
      expect(model.maxCargo, json[ShipSchema.maxCargoKey]);
      expect(model.plating, json[ShipSchema.platingKey]);
      expect(model.spaceAvailable, json[ShipSchema.spaceAvailableKey]);
      expect(model.speed, json[ShipSchema.speedKey]);
      expect(model.type, json[ShipSchema.typeKey]);
      expect(model.weapons, json[ShipSchema.weaponsKey]);
      expect(model.x, json[ShipSchema.xKey]);
      expect(model.y, json[ShipSchema.yKey]);
    });
  });
}
