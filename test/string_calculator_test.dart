import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group("String calculator TDD", () {
    test('return 0 if empty string', () {
      expect(add(''), 0);
    });

    test("return the number if one no is given", () {
      expect(add('3'), 3);
    });

    test('return the sum of two no if two no is given', () {
      expect(add('3,5'), 8);
    });

    test('return the sum of all digit ', () {
      expect(add('3,5,1,2,3'), 14);
    });
  });
}
