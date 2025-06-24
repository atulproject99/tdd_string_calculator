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

    test('return 6 if “1\n2,3”', () {
      expect(add('1\n2,3'), 6);
    });

    /// Support custom delimiters
    test('return 6 if //;\n1;2', () {
      expect(add('//;\n1;2'), 3);
    });

    /// Not allowed negative numbers

    test(
      'throws exception  `negative no not allowed ` if numbers contain negative no',
      () {
        expect(
          () => add('1,-2,3'),
          predicate(
            (e) =>
                e is FormatException && e.message == 'negative not allowed -2',
          ),
        );
      },
    );
  });
}
