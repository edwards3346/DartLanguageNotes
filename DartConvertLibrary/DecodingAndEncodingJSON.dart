//
// dart:convert Library
// Original website:
// https://dart.dev/guides/libraries/library-tour#
// decoding-and-encoding-json
// 

import 'dart:convert';

// Decoding and encoding JSON

void decodingAndEncodingJSON() {
  // Decode a JSON-encoded string into a Dart object with
  // jsonDecode():

  // NOTE: Be sure to use double quotes("), 
  // not single quotes ('), inside the JSON string. 
  // This string is JSON, not Dart. 

  var jsonString = '''
    [
      {"score":40}, 
      {"score":80}
    ]
  '''; 

  var scores = jsonDecode(jsonString); 
  print(scores is List); // true

  var firstScore = scores[0]; 
  print(firstScore is Map); // true
  print(firstScore['score']); // 40

  // Encode a supported Dart object into a JSON-formatted string
  // with jsonEncode():

  scores = [
    {'score': 40}, 
    {'score': 80}, 
    {'score': 100, 'overtime': true, 'special_guest': null}
  ]; 

  var jsonText = jsonEncode(scores); 
  print(jsonText); // '[{"score":40},{"score":80},
  // {"score":100,"overtime":true,"special_guest":null}]

  // Only objects of type int, double, String, bool, null, List, 
  // or Map (with string keys) are directly encodable into JSON.
  // List and Map objects are encoded recursively. 

  // You have two options for encodig objects that aren't directly
  // encodable. The first is to invoke encode() with a second 
  // argument: a function that returns an object that is directly
  // encodable. Your second option is to omit the second argument,
  // in which case the encoder calls the object's toJson() method. 
}

void main() {
  decodingAndEncodingJSON(); 
}
