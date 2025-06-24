int add(String numbers) {
  if (numbers.isEmpty) return 0;
  String delimiterPattern = '[,\n]';
  if (numbers.startsWith('//')) {
    final newLineIndex = numbers.indexOf('\n');
    final customDelimiters = numbers.substring(2, newLineIndex);
    delimiterPattern = RegExp.escape(customDelimiters);
    numbers = numbers.substring(newLineIndex + 1);
  }
  return numbers
      .split(RegExp(delimiterPattern))
      .map((e) => int.parse(e))
      .reduce((a, b) => a + b);
}
