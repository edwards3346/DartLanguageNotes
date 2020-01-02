//
// dart:core Library
// Original website:
// https://dart.dev/guides/libraries/library-tour#strings-and-regular-expressions
// 

// Strings and regular expressions.
void stringsAndRegularExpressions() {
  // Searching inseide a string.
  print('Never odd or even'.contains('odd')); // true
  print('Never odd or even'.startsWith('Never')); // true
  print('Never odd or even'.endsWith('even')); // true

  // Find the location of a string that first appears.
  print('never odd or even'.indexOf('odd')); // 6


  // Extracting data from a string
  print('Never odd or even'.substring(6, 9)); // 'odd'

  // Split a string using a string pattern. Use '' pattern
  // to get all character in the string. 
  var parts = 'structured web apps'.split(' '); 
  print(parts.length); //3

  // Get a UTF-16 code unit by index.
  print('Never odd or even'[0]); // 'N'

  // Get all the UTF-16 code units in the string.
  var codeUnitList = 'Never odd or even'.codeUnits.toList(); 
  for (var char in codeUnitList) {
    print('$char'); // The ASCII of each character.
  }

  // Convert to uppercase. 
  print('structured web apps'.toUpperCase()); // 'STRUCTURED ...'
  print('STRUCTURED WEB APPS'.toLowerCase()); // 'structured ...'

  // Trimming and empty strings.
  print('    hello   '.trim()); // 'hello'

  // Check whether a string is empty. 
  print(''.isEmpty); // true

  // Replacing part of a string
  // Strings are immutable objects, which means you can create them
  // but you can't change them. For example, the method replaceAll()
  // returns a new String without changing the original String.
  var greetingTemplate = 'Hello, NAME!'; 
  var greeting = 
      greetingTemplate.replaceAll(RegExp('NAME'), 'Bob'); 
  // greeingTemplate didn't change.
  print(greeting != greetingTemplate); // true

  // Building a string
  // To programmatically generate a string, you can use StringBuffer.
  // A StringBuffer doesn't generate a new String object until
  // toString() is called. The writeAll() method has an optional
  // second parameter that lets you specify a sepatator - in this 
  // case, a space.
  var sb = StringBuffer(); 
  sb 
    ..write('Use a String Buffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.'); 
  // Generating finishes.
  var fullString = sb.toString(); 
  print(fullString); // '.... for efficient string creation.'

  // Regular expressions
  // Use regular expressions for efficient searching and 
  // pattern matching of strings.

  // Here's a regular expression for one or more digits.
  var numbers = RegExp(r'\d+'); 
  var someDigits = 'llamas live 15 to 20 years'; 

  print(someDigits.contains(numbers)); // true

  // Replace every match with another string.
  var exedOut = someDigits.replaceAll(numbers, 'XX'); 
  print(exedOut); // 'llamas live XX to XX years'

  // You can work directly with the RegExp class.
  // Check whether the reg exp has a match in a string.
  print(numbers.hasMatch(someDigits)); // true
  // Loop through all matches.
  for (var match in numbers.allMatches(someDigits)) {
    print(match.group(0)); // 15, then 20
  }

}
