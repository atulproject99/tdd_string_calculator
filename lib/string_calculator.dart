int add(String numbers) {
  if (numbers.isEmpty) return 0;
  String delimiterPattern = '[,\n]';
  if (numbers.startsWith('//')) {
    final newLineIndex = numbers.indexOf('\n');
    final customDelimiters = numbers.substring(2, newLineIndex);
    delimiterPattern = RegExp.escape(customDelimiters);
    numbers = numbers.substring(newLineIndex + 1);
  }
  final inputs =
      numbers.split(RegExp(delimiterPattern)).map((e) => int.parse(e)).toList();

  final negativeNoList = inputs.where((e) => e < 0).map((e) => e).toList();
  if (negativeNoList.isNotEmpty) {
    throw FormatException('negative not allowed ${negativeNoList[0]}');
  }

  return inputs.reduce((a, b) => a + b);
}
