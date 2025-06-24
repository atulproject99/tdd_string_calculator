int add(String numbers) {
  if (numbers.isEmpty) return 0;
  String delimiterPattern = '[,\n]';
  return numbers
      .split(RegExp(delimiterPattern))
      .map((e) => int.parse(e))
      .reduce((a, b) => a + b);
}
