//
// dart:math Library
// Original website:
// https://dart.dev/guides/libraries/library-tour#random-numbers
// 

import 'dart:math';

// Random numbers

void randomNumbers() {

  // Generate random numbers with the Random class. You can 
  // optionally provide a seed to the Random constructor. 

  var random = Random(); 
  random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
  random.nextInt(10); // Between 0 and 9. 

  // You can even generate random booleans:

  random.nextBool(); // true or false
}

void main() {
  randomNumbers(); 
}