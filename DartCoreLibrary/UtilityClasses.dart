//
// dart:core Library
// Original website:
// https://dart.dev/guides/libraries/library-tour#utility-classes
// 

// Utility classes
class Line implements Comparable<Line> {
  final int length; 
  const Line(this.length); 

  @override
  int compareTo(Line other) => length - other.length; 
}

class Person {
  final String firstName, lastName; 
  
  Person(this.firstName, this.lastName); 
  
  // Override hashCode using strategy from Effective Java, 
  // Chapter 11.
  @override
  int get hashCode {
    int result = 17; 
    result = 37 * result + firstName.hashCode; 
    result = 37 * result + lastName.hashCode; 
    return result; 
  }

  // You should generally implement operator == if you
  // override hashCode.
  @override 
  bool operator ==(dynamic other) {
    if (other is! Person) return false; 
    Person person = other; 
    return (person.firstName == firstName &&
        person.lastName == lastName); 
  }
}

// Utility classes 
// The core library contains various utility classes, useful 
// for sorting, mapping values, and iterating.
void utilityClasses() {

  // Comparing objects
  // Implement the Comparable interface to indicate that an 
  // object can be compared to another object, usually for 
  // sorting. The compareTo() method returns <0 for smaller, 
  // 0 for the same, and >0 for bigger. 

  var short = const Line(1); 
  var long = const Line(100); 
  print(short.compareTo(long) < 0); // true

  // Implementing map keys
  // Each object in Dart automatically provides an integer hash code, 
  // and thus can be used as a key in a map. However, you can 
  // override the hashCode getter to generate a custom hash code.
  // If you do, you might also want to override the == operator.
  // Objects that are equal (via ==) must have identical hash codes. 
  // A hash code doesn't have to be unique, but it should be well
  // distributed. 
  var p1 = Person('Bob', 'Smith'); 
  var p2 = Person('Bob', 'Smith'); 
  var p3 = 'not a person'; 
  print(p1.hashCode == p2.hashCode); // true
  print(p1 == p2); // true
  print(p1 != p3); // true

  // Iteration
  // the Iterable and Iterator classes support for-in loops. Extend (if 
  // possible) or implement Iterable whenever you create a class that
  // can provide Iterators for use in for-in loops. Implement Iterator
  // to define the actual iteration ability.
  // 
  // class Process {
  //    // Represent a process...
  // }
  // 
  // class ProcessIterator implements Iterator<Process> {
  //    @override
  //    Process get current => ...
  //    @override
  //    bool moveNext() => ...
  // }
  //
  // A mythical class that lets you iterate through all processes.
  // Extends a subclass of [Iterable].
  // class Processes extends IterableBase<Process> {
  //    @override
  //    final Iterator<Process> iterator = ProcessIterator(); 
  // }
  // 
  // void main() {
  //    // Iterable objects can be used with for-in. 
  //    for (var process in Processes()) {
  //      // Do something with the process.
  //    }
  // }
}