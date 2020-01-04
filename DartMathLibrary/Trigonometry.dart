//
// dart:math Library
// Original website:
// https://dart.dev/guides/libraries/library-tour#trigonometry
// 

import 'dart:math';

// Trigonometry
// Note: These functions use radians, not degrees! 
// The Math library provides basic trigonometric functions:

void trigonometry() {
  // Cosine
  print(cos(pi) == -1.0); // true; 

  // Sine
  var degrees = 30; 
  var radians = degrees * (pi / 180); 
  // radias is now 0.52359. 
  var sinOf30degrees = sin(radians); 
  // sin 30 = 0.5
  print((sinOf30degrees - 0.5).abs() < 0.01); // true
}

void main() {
  trigonometry(); 
}
