double roundToMaxDecimalDigit(double number) {
  int integerPart = number.truncate();
  String decimalStr = number.toString().split('.').last;

  int maxDigit = decimalStr
      .split('')
      .map(int.parse)
      .reduce((a, b) => a > b ? a : b);

  return integerPart + (maxDigit / 10);
}