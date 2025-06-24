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
          throwsA(
            predicate(
              (e) =>
                  e is FormatException &&
                  e.message == 'negative not allowed -2',
            ),
          ),
        );
      },
    );

    test(
      'throws exception  `negative no not allowed ` and return no by separated by commas if multiple  numbers provided',
      () {
        expect(
          () => add('1,-2,3,-5'),
          throwsA(
            predicate(
              (e) =>
                  e is FormatException &&
                  e.message == 'negative not allowed -2,-5',
            ),
          ),
        );
      },
    );

    test(
      'Numbers bigger than 1000 should be ignored so adding 2 + 1001 = 2',
      () {
        expect(add('2,1002,5'), 7);
      },
    );

    ///Delimiters can be of any length with the following format: “//[delimiter]\n” for example: “//[***]\n1***2***3” should return 6

    test("//[***]\n1***2***3” should return 6", () {
      expect(add('//[***]\n1***2***3'), 6);
    });
  });
}
