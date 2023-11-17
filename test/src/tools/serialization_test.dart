import 'package:dart_spacetraders/src/tools/serialization.dart';
import 'package:test/test.dart';

void main() {
  group('typeCheck', () {
    test('typeCheck should return the data if it is of the correct type', () {
      final intData = 42;
      final stringData = 'hello';

      expect(typeCheck<int>(intData), equals(intData));
      expect(typeCheck<String>(stringData), equals(stringData));
    });

    test(
        'typeCheck should throw a FormatException if the data is not of the correct type',
        () {
      final dynamicData = 'dynamic data';

      expect(() => typeCheck<int>(dynamicData), throwsFormatException);
    });
  });
}
