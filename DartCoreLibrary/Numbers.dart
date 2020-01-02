//
// dart:core Library
// Original website:
// https://dart.dev/guides/libraries/library-tour#numbers
// 

// Numbers
void numbers() {
  // Convert a String to an integer.
  print(int.parse('42') is int); // true 
  print(int.parse('0x42')); // 66
  print(double.parse('0.50')); // 0.5

  // Or use num.parse directly.
  print(num.parse('0.50')); // 0.5

  // Or specify the base of an integer, add a radix parameter.
  print(int.parse('42', radix:16)); // 66


  // Convert an integer to a String.
  print(123.456.toString()); // '123.456'

  // Specify the number of digits after the decimal.
  print(123.456.toStringAsFixed(2)); // '123.46'

  // Specify the number of significant figures.
  print(123.456.toStringAsPrecision(2)); // '1.2e+2'
  print(double.parse('1.2e+2')); // 120.0
}
