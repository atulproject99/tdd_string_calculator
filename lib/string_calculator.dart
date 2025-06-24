int add(String numbers) {
  if (numbers.isEmpty) return 0;
  // Default delimiters: comma and newline
  String delimiterPattern = '[,\n]';

  // Check for custom delimiter
  if (numbers.startsWith('//')) {
    final newLineIndex = numbers.indexOf('\n');
    final customDelimiterSection = numbers.substring(2, newLineIndex);
    if (customDelimiterSection.startsWith('[')) {
      // Multiple custom delimiters like //[***][%%]
      final matches = RegExp(r'\[(.*?)\]').allMatches(customDelimiterSection);
      final escapedDelimiters =
          matches.map((e) => RegExp.escape(e.group(1)!)).toList();
      delimiterPattern = escapedDelimiters.join('|');
    } else {
      // Single character delimiter like //;
      delimiterPattern = RegExp.escape(customDelimiterSection);
    }
    // Remove the delimiter declaration from the input string
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

  return inputs.fold(0, (a, b) => a + b);
}
