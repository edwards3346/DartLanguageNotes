//
// dart:convert Library
// Original website:
// https://dart.dev/guides/libraries/library-tour#
// decoding-and-encoding-utf-8-characters
// 

import 'dart:convert';

// Decoding and encoding UTF-8 characters

void decodingAndEncodingUTF8Characters() {
  // Use utf8.decode() to decode UFT8-encoded bytes to a Dart
  // string:

  List<int> utf8Bytes = [
    0xc3, 0x8e, 0xc3, 0xb1, 0xc5, 0xa3, 0xc3, 0xa9,
    0x72, 0xc3, 0xb1, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3,
    0xae, 0xc3, 0xb6, 0xc3, 0xb1, 0xc3, 0xa5, 0xc4,
    0xbc, 0xc3, 0xae, 0xc5, 0xbe, 0xc3, 0xa5, 0xc5,
    0xa3, 0xc3, 0xae, 0xe1, 0xbb, 0x9d, 0xc3, 0xb1
  ]; 

  var funnyWord = utf8.decode(utf8Bytes); 
  print(funnyWord); // Îñţérñåţîöñåļîžåţîờñ

  // To convert a stream of UTF-8 characters into a Dart string, 
  // specify utf8.decoder to the Stream transform() method:
  
  // var lines = 
  //     utf8.decoder.bind(inputStream).transform(LineSplitter()); 
  
  // try {
  //   await for (var line in lines) {
  //     print('Got ${line.length} characters from stream'); 
  //   }
  //   print('file is now closed'); 
  // } catch (e) {
  //   print(e); 
  // }

  // Use utf8.encode() to encode a Dart string as a list of 
  // UTF8-encoded bytes:

  List<int> encoded = utf8.encode('Îñţérñåţîöñåļîžåţîờñ'); 

  print(encoded.length == utf8Bytes.length); // true
  for (int i = 0; i < encoded.length; i++) {
    print(encoded[i] == utf8Bytes[i]); // true 
  }
}

void main() {
  decodingAndEncodingUTF8Characters(); 
}