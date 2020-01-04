//
// dart:core Library
// Original website:
// https://dart.dev/guides/libraries/library-tour#collections
// 

// Collections
// Dart ships with a core collections API, which includes classes
// for lists, sets, and maps.
void collections() {

  // Lists
  // Use a List constructor or simply use a list literal.
  var vegetables = List(); 
  var fruits = ['apples', 'oranges']; 

  // Add to a list
  fruits.add('kiwis'); 
  fruits.addAll(['grapes', 'bananas']); 

  // Remove a single item. 
  // print(fruits.remove('apples')); // true
  var appleIndex = fruits.indexOf('apples'); 
  fruits.removeAt(appleIndex); 

  // Remove all elements from a list.
  fruits.clear(); 
  print(fruits.isEmpty); // true

  // Sort a list using the sort() method. You can provide a sorting
  // functioon that compares two objects. The sorting function must
  // return < 0 for smaller, 0 for the same, and > 0 for bigger.
  fruits = ['bananas', 'apples', 'oranges']; 
  // compareTo() is defined by Comparable and implemented by String.
  // The results is ['apples', 'bananas', 'oranges'] in this case.
  fruits.sort((a, b) => a.compareTo(b)); 

  // Lists are parameterized types.
  fruits = List<String>(); 
  fruits.add('apples'); 


  // Sets
  // A set in Dart is an unordered collection of unique items. 
  // Because a set is unordered, you can't get a set's items
  // by index.
  var ingredients = Set(); 
  ingredients.addAll(['gold', 'titanium', 'xenon']); 

  // Check whether one or many items is in the set.
  print(ingredients.contains('titanium')); // true
  print(ingredients.containsAll(['titanium', 'xenon'])); // true

  // Intersection between two sets.
  var nobleGases = Set.from(['xenon', 'argon']); 
  var intersection = ingredients.intersection(nobleGases); 
  print(intersection.contains('xenon')); // true; 
  

  // Maps
  // Unlike in JavaScipt, Dart objects are not maps.

  var nobleGases2 = {
    54: 'xenon', 
  }; 

  // Check whether a map contains a key.
  print(nobleGases2.containsKey(54)); // true

  // Remove a key and its value.
  nobleGases2.remove(54); 

  // You can retrieve all the values or all the keys from a map.
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'kailua', 'Waimanalo'], 
    'Big Island': ['Wailea Bay', 'Pololu Beach'], 
    'Kauai': ['Hanalei', 'Poipu'], 
  }; 

  // Get all the keys as an unordered collection
  // (an Iterable).
  var keys = hawaiianBeaches.keys; 
  print(Set.from(keys).contains('Oahu')); // true

  // Get all the values as an unordered collection
  // (an Iterable of Lists)
  var values = hawaiianBeaches.values; 
  print(values.any((v) => v.contains('Waikiki'))); // true 

  // To check whether a map contains a key, use containKey().
  print(hawaiianBeaches.containsKey('Oahu')); 

  // Attention: Because map values can be null, you cannot rely on
  // simply getting the value for the key and checking for null to
  // determine the existence of a key. 

  // Use the putIfAbsent() method when you want to assign a value
  // to a key if and only if the key does not already exist in
  // a map. You must provide a function that returns the value.
  var teamAssignments = {}; 
  teamAssignments.putIfAbsent(
        'Catcher', () {}); 
  print(teamAssignments['Catcher']); // null


  // Common collection methods
  // List, Set, and Map share common functionality found in many 
  // collections. Some of this common functionality is defined by
  // the Iterable class, which List and Set implement.
  // (Although Map doesn't implement Iterable, you can get 
  // Iterables from it using the Map keys and values properties.)

  // Use isEmpty or isNotEmpty to check whether a list, set, or 
  // map has items.

  // To apply afunction to each item in a list, set, or map, you
  // can use forEach().
  var teas = ['green', 'black', 'chamomile', 'earl grey']; 
  teas.forEach((tea) => print('I drink $tea')); 

  // When you invoke forEach() on a map, your function must take
  // two arguments (the key and value); 
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v'); 
  }); 

  // Iterables provide the map() method, which gives you all the
  // results in a single object.
  var loudTeas = teas.map((tea) => tea.toUpperCase()); 
  loudTeas.forEach(print); 

  // To force your function to be called immediately on each 
  // item, use map().toList() or map().toSet().
  loudTeas = 
      teas.map((tea) => tea.toUpperCase()).toList(); 

  // Use Iterable's where() method to get all the items that match
  // a condition. Use Iterable's any() and every() methods to 
  // check whether some or all items match a condition.

  // Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) => 
      teaName == 'chamomile'; 
  
  // Use where() to find only the items that return true
  // from the provided funciton.
  // It returns an Iterable.
  var decaffeinatedTeas = 
      teas.where((tea) => isDecaffeinated(tea)); 
  // or teas.where(isDecaffeinated)

  // Use any() to check whether at least one item in the 
  // collection satisfies a condition.
  print(teas.any(isDecaffeinated)); // true

  // Use every() to check whether all the items in a
  // collection satisfy a condition.
  print(teas.every(isDecaffeinated)); // false

}

void main() {
  collections(); 
}