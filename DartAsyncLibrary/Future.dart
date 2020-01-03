//
// dart:async Library
// Original website:
// https://dart.dev/guides/libraries/library-tour#future
// 


import 'dart:async';

import 'dart:html';

// Version note: As of Dart 2.1, you don't need to import 
// dart async to use the Future and Stream APIs, because dart:core
// exports those classes. 

// Future
// Future objects appear throughout the Dart libraries, often as 
// the object returned by an asynchronous method. When a future 
// completes, its value is ready to use. 


// Using await
// Before you directl use the Future API, consider using await 
// instead. Code that uses await expression can be easier to 
// understand than code that uses the Future API.
//
// Consider the following function. It uses Future's then() method
// to execute three asynchronous functions in a row, waiting for 
// each one to complete before executing the next one. 

// runUsingFuture() {
//   // ...
//   findEntryPoint().then((entryPoint) {
//     return runExecutable(entryPoint, args); 
//   }).then(flushThenExit); 
// }

// The equivalent code with await expressions looks more like
// synchronous code:

// runUsingAsyncAwait() async {
//   // ...
//   var entryPoint = await findEntryPoint(); 
//   var exitCode = await runExecutable(entryPoint, args); 
//   await flushThenExit(exitCode); 
// }

// An async function can catch exceptions from Futures. For example:

// runUsingAsyncAwait() async {
//   var entryPoint = await findEntryPoint(); 
//   try {
//     var exitCode = await runExecutable(entryPoint, args); 
//     await flushThenExit(exitCode); 
//   } catch (e) {
//     // Handle the error... 
//   }
// }

// Important: Async functions return Futures. If you don't want 
// your function to return a future, then use a different solution.
// For example, you might call an async function from your function.


// Basic usage
// You can use then() to schedule code that runs when the future
// completes. For example, HttpRequest.getString() returns a 
// Future, since HTTP requests can take a while. Using then() lets
// run some code when that Future has completed and the promised 
// string value is available:

// HttpRequest.getString(url).then((String result) {
//   print(result); 
// }); 

// Use catchError() to handle any errors to exceptions that a 
// Future object might throw.

// HttpRequest.getString(url).then((String result) {
//   print(result); 
// }).catchError((e) {
//   // Handle or ignore the error. 
// }); 

// The then().catchError() pattern is the asynchronous version
// of try-catch.

// Important: Be sure to invoke catchError() on the result of 
// then() - not on the result of the original Future. Otherwise, 
// the catchError() can handle errors only from the original 
// Future's computation, but not from the handler registered by
// then().


// Chaining multiple asynchronous methods
// The then() method returns a Future, providing a useful way to
// run multiple asynchronous functions in a certain order. If the 
// callback registered with then() returns a Future, then() 
// then() returns an equivalent Future. If the callback returns a 
// value of any other type, then() creates a new Future that 
// completes with the value. 

// Future result = costlyQuery(url); 
// result
//     .then((value) => expensiveWork(value))
//     .then((_) => lengthyComputation())
//     .then((_) => print('Done!'))
//     .catchError((exception) {
//       // Handle exception...
//     }); 

// In the preceding example, the methods run in the following 
// order:
// 1. costlyQuety()
// 2. expensiveWork()
// 3. lengthyComputaion()

// here is the same code written using await:

// try {
//   final value = await costlyQuery(url); 
//   await expensiveWork(value); 
//   await lengthyComputation(); 
//   print('Done!'); 
// } catch (e) {
//   // Handle exception...
// }


// Waiting for multiple futures
// Sometimes your algorithm needs to invoke many asynchronous 
// and wait for them all to complete before continuing. Use
// the Future.wait() static method to manage multiple Futures
// and wait for them to complete:

// Future deleteLotsOfFiles() async => ...
// Future copyLotsOfFiles() async => ...
// Future checksumLotsOfOtherFiles() async => ...
// 
// await Future.wait([
//   deleteLotsOfFiles(), 
//   copyLotsOfFiles(), 
//   checksumLotsOfOtherFiles(), 
// ]); 
// print('Done with all the long steps!'); 
