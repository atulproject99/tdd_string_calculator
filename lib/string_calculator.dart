int add(String numbers) {
  if (numbers.isEmpty) return 0;
  String delimiterPattern = '[,\n]';
  if (numbers.startsWith('//')) {
    final newLineIndex = numbers.indexOf('\n');
    final customDelimiterSection = numbers.substring(2, newLineIndex);
    if (customDelimiterSection.startsWith('[')) {
      final matches = RegExp(r'\[(.*?)\]').allMatches(customDelimiterSection);
      final escapedDelimiters =
          matches.map((e) => RegExp.escape(e.group(1)!)).toList();
      delimiterPattern = escapedDelimiters.join('|');
    } else {
      delimiterPattern = RegExp.escape(customDelimiterSection);
    }

    numbers = numbers.substring(newLineIndex + 1);
  }
  final inputs =
      numbers
          .split(RegExp(delimiterPattern))
          .map((e) => int.parse(e))
          .where((e) => e <= 1000)
          .toList();

  final negativeNoList = inputs.where((e) => e < 0).map((e) => e).toList();
  if (negativeNoList.isNotEmpty) {
    throw FormatException('negative not allowed ${negativeNoList.join(',')}');
  }

  return inputs.reduce((a, b) => a + b);
}
