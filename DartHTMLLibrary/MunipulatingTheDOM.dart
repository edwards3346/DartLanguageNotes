//
// dart:html Library
// Original website:
// https://dart.dev/guides/libraries/library-tour#
// manipulating-the-dom
// 

import 'dart:html';

void manipulatingTheDOM() {
  // To use the DOM, you need to know about windows, documents, 
  // elements, and nodes. 
  // 
  // A Window object represents the actual window of the web 
  // browser. Each Window has a Document object, which points to 
  // the document that's currently loaded. The Window object also
  // has accessors to various APIs such as IndexedDB (for storing
  // data), requestAnimationFrame (for animations), and more. In
  // tabbed browsers, each tab has its own Window object. 
  //
  // With the Document object, you can create and manipulate 
  // Element objects within the document. Note that the  
  // document itself is an element and can be manipulated. 
  // 
  // The DOM models a tree of Nodes. These nodes are often 
  // elements, but they can also be attributes, text, comments, 
  // and other DOM types。 Except for the root node, which has
  // no parent, each node in the DOM has one parent and might
  // have may children

  // Finding elements
  // To manipulate an element, you first need an object that 
  // represents it. You can get this object using a query. 
  // 
  // Find one or more elements using the top-level functions
  // querySelector() and querySelectorAll(). You can query 
  // by ID, class, tag, name, or any combination of these. 
  // The CSS Selector Specification guide defines the formats
  // of the selectors such as uding a #prefix to specify IDs
  // and a period (.) for classes. 
  // 
  // The queryDelector() function returns the first element 
  // that matches the selector, while querySelectorAll() 
  // returns a collection of elements that match the selector.

  // Find an element by id (an-id). 
  Element elem1 = querySelector('#an-id'); 

  // Find an element by class (a-class).
  Element ele2 = querySelector('.a-class'); 

  // Find all text inputs.
  List<Element> elems1 = querySelectorAll('div'); 

  // Find all text inputs. 
  List<Element> elems2 = querySelectorAll(
    'input[type="text"]', 
  ); 

  // Find all elements with the CSS class 'class'
  // inside of a <p> that is inside a element with
  // the ID 'id'. 
  List<Element> elems3 = querySelectorAll('#id p.class'); 

  
}
