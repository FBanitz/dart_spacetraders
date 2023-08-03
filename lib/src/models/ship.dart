// {
//   "cargo": [],
//   "class": "MK-I",
//   "flightPlanId": "ckon8lk9m005354nz12qjbucx",
//   "id": "ckon84fo20196vinzktdlvdlv",
//   "location": "OE-PM-TR",
//   "manufacturer": "Jackshaw",
//   "maxCargo": 50,
//   "plating": 5,
//   "spaceAvailable": 32,
//   "speed": 1,
//   "type": "JW-MK-I",
//   "weapons": 5,
//   "x": 21,
//   "y": -24
// },

class ShipSchema {
  static const String table = 'ship';
  static const String listTable = 'ships';
  static const String cargo = 'cargo';
  static const String shipClass_ = 'class';
  static const String flightPlanId = 'flightPlanId';
  static const String id = 'id';
  static const String location = 'location';
  static const String manufacturer = 'manufacturer';
  static const String maxCargo = 'maxCargo';
  static const String plating = 'plating';
  static const String spaceAvailable = 'spaceAvailable';
  static const String speed = 'speed';
  static const String type = 'type';
  static const String weapons = 'weapons';
  static const String x = 'x';
  static const String y = 'y';
}

class Ship {}
