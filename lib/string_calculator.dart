int add(String numbers) {
  if (numbers.isEmpty) return 0;
  return numbers.split(',').map((e) => int.parse(e)).reduce((a, b) => a + b);
}
