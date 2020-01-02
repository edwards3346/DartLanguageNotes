//
// dart:core Library
// Original website:
// https://dart.dev/guides/libraries/library-tour#uris
// 

// URIs
// The Uri class provides functions to encode and decode strings 
// for use in URIs (which you might know as URLs). These functions
// handle characters that are special for URIs, such as & and =. 
// The Uri class also parses and exposes the components of a URI -
// host, port, scheme, and so on.
void uris() {
  
  // Encoding and decoding fully qualified URIs
  // To encode and decode characters except those with special 
  // meaning in a URI(such as /, :, &, #), use the encodeFull()
  // and decodeFull methods. These methods are good for encoding
  // or decoding a fully qualified URI, leaving intact special
  // URI character.
  var uri = 'https://example.org/api?foo=some message'; 

  var encoded = Uri.encodeFull(uri); 
  print(encoded); // https://example.org/api?foo=some%20message

  var decoded = Uri.decodeFull(encoded); 
  print(decoded); // https://example.org/api?foo=some message

  // To encode and decode all of string's characters, use 
  // encodeComponent() and decodeComponent() method.
  encoded = Uri.encodeComponent(uri); 
  // https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message
  print(encoded); 

  decoded = Uri.decodeComponent(encoded); 
  // https://example.org/api?foo=some message
  print(decoded); 

  // Parsing URIs 
  // If you have a Uri object or a URI string, you can get its
  // parts using Uri fields such as path. To create a Uri from
  // a string, use the parse() static method.

  var uri2 = Uri.parse('https://example.org:8080/foo/bar#frag'); 

  print(uri2.scheme); // 'https'
  print(uri2.host); // 'example.org'
  print(uri2.path); // '/foo/bar'
  print(uri2.fragment); // 'frag'
  print(uri2.origin); // 'https://example.org:8080'

  // Building URIs
  // You can build up a URI from individual parts using the Uri()
  // constructor.
  var uri3 = Uri(
      scheme: 'https', 
      host: 'example.org', 
      path: '/foo/bar', 
      fragment: 'frag', 
  ); 
  print(uri3.toString()); // 'https://example.org/foo/bar#frag'

}
