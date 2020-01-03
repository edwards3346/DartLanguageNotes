//
// dart:async Library
// Original website:
// https://dart.dev/guides/libraries/library-tour#stream
// 

import 'dart:io';
import 'dart:convert';


// Stream
// Stream objects appear throughout Dart APIs, representing 
// sequences of data. For example, HTML events such as 
// button clicks are delivered using streams. You can also read
// a file as a stream. 

// Using an asynchronous for loop
// Sometimes you can use an asynchronous for loop (await for) 
// instead of using the Stream API. 
// Consider the following function. It uses Stream's listen() 
// method to subscribe to a list of files, passing in a function
// literal that searches each file or directory. 

// void main(List<String> arguments) {
//   // ...
//   FileSystemEntity.isDirectory(searchPath).then((isDir) {
//     if (isDir) {
//       final startingDir = Directory(searchPath); 
//       startingDir
//           .list(
//             recursive: argResults[recursive], 
//             followLinks: arfResults[followLinks])
//           .listen((entity) {
//             if (entity is File) {
//               searchFile(entity, searchTerms); 
//             }
//           }); 
//     } else {
//       searchFile(File(searchPath), searchTerms); 
//     }
//   }); 
// }

// The equivalent code with await expressions, including an 
// asynchronous for loop (await for), looks more like synchronous
// code:

// Future main(List<String> arguments) async {
//   // ...
//   if (await FileSystemEntity.isDirectory(searchPath)) {
//     final startingDir = Directory(searchPath); 
//     await for (var entity in startingDir.list(
//       recursive: argResults[recursive], 
//       followLinks: argResults[followLinks]
//     )) {
//       if (entity is File) {
//         searchFile(entity, searchTerms); 
//       }
//     }
//   } else {
//     searchFile(File(searchPath), searchTerms); 
//   }
// }

// Important: Before using await for, make sure that it makes the
// code clearer and that you really do want to wait for all of 
// the stream's results. For example, you usually should not use
// await for for DOM event listeners, because the DOM sends endless
// streams of events. If you use await for to register two DOM 
// event listeners in a row, then the second kind of event is 
// never handled. 


// Listening for stream data
// To get each value as it arrives, either use await for or 
// subscribe to the stream using the listen() method:

// // Find a button by ID and add an event handler. 
// querySelector('#submitInfo').onClick.listen((e) {
//   // When the button is clicked, it runs this code. 
//   submitData(); 
// }); 

// In this example, the onClick property is a Stream object 
// provided by the "submitInfo" button. 
// If you care about only one event, you can get it using a 
// property such as first, last, or single. To test the event 
// before handling it, use a method such as firstWhere(), 
// lastWhere, or singleWhere(). 
// If you care about a subset of events, you can use methods
// such as skip(), skipWhile(), take(), takeWhile(), and 
// where(). 

// Transforming stream data
// Often, you need to change the format of a stream's data before
// you can use it. use the transform() method to produce a stream
// with a different type of data:

// var lines = inputStream
//     .transform(utf8.decoder)
//     .transform(LineSplitter()); 

// This example uses two transformers. First it uses utf8.decoder
// to transform the stream of integers into a stream of strings. 
// Then it uses a LineSplitter to transform the stream of strings
// into a stream of separate lines. These transformers are from 
// the dart:convert library. 

// Handling errors and completion
// How you specify error and completion handling code depends on 
// whether you use an asynchronous for loop (await for) or the 
// Stream API. 
// If you use an asynchronous for loop, then use try-catch to 
// handle errors. Code that executes after the stream is closed
// goes after the asynchronous for loop. 

Future readFileAwaitFor() async {
  var config = File('config.txt'); 
  Stream<List<int>> inputStream = config.openRead(); 

  var lines = inputStream
      .transform(utf8.decoder)
      .transform(LineSplitter()); 
  try {
    await for (var line in lines) {
      print('Got ${line.length} characters from stream'); 
    }
    print('file is now closed'); 
  } catch (e) {
    print(e); 
  }
}

// If you use Stream API, then handle errors by register an
// onError listener. Run code after the stream is closed by
// registering an onDone listener. 

// var config = File('config.txt'); 
// Stream<List<int>> inputStream = config.openRead(); 

// inputStream
//     .transform(utf8.decoder)
//     .transform(LineSplitter())
//     .listen((String line) {
//       print('Fot ${line.length} characters from stream'); 
//     }, onDone: () {
//       print('file is now closed'); 
//     } onError: (e) {
//       print(e); 
//     }); 
 