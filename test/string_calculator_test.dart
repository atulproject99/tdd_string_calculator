import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group("String calculator TDD", () {
    test('return 0 if empty string', () {
      expect(add(''), 0);
    });
  });
}
