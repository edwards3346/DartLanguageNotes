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


  // Manipulating elements
  // You can use properties to change the state of an element.
  // Node and its subtype Element define the properties that
  // you can use to set state. Subclasses of Element define
  // additional properties, such as the href property of 
  // AnchorElement. 

  // Consider this example of specifying an anchor element
  // in HTML

  // <a id="example" href="/another/example">link text</a?

  // This <a> tag specifies an element with an href attribute
  // and a text node (accessible via a text property) that
  // contains the string "linktext". To change the URL that 
  // the link goes to, you can use AnchorElement's href
  // property:

  var anchor = querySelector('#example') as AnchorElement; 
  anchor.href = 'https://dart.dev'; 

  // Often you need to set properties on multiple elements.
  // For example, the following code sets the hidden
  // property of all elements that have a class of "mac", 
  // "win", or "linux". Setting the hidden property to 
  // true has the same effect as adding display:none to CSS.

  // <!-- In HTML: -->
  // <p>
  //    <span class="linux">Words for Linux</span>
  //    <span class="macos">Words for Mac</span>
  //    <span class="windows">Words for Windows</span>
  // </p>

  // In Dart:
  // final osList = ['macos', 'windows', 'linux']; 
  // final userOs = determineUserOs(); 

  // // For each possible OS...
  // for (var os in osList) {
  //   // Matches user OS?
  //   bool shouldShow = (os == userOs); 

  //   // Find all elements with class=os. For example, if 
  //   // os == 'windows', call querySelectorAll('.windows')
  //   // to find all elements with the class "windows".
  //   // Note that '.$os' uses string interpolation.
  //   for (var elem in querySelectorAll('.$os')) {
  //     elem.hidden = !shouldShow; 
  //   }
  // }

  // When the right property isn't available or convenient, 
  // you can use Element's attributes property. This 
  // property is a Map<String, String>, where the keys are
  // attribute names. For a list of attribute names and 
  // their meanings, see the MDN Attributes page. Here's an
  // example of setting an attribute's value:

  // elem.attributes['someAttribute'] = 'someValue'; 
  

  // Creating elements 
  // You can add to existing HTML pages by creating new 
  // elements and attaching them to the DOM. Here's an
  // example of creating a paragraph (<p>) element:

  // var elem = ParagraphElement(); 
  // elem.text = 'Creating is easy!'; 

  // You can also create an element by parsing HTML text. 
  // Any child elements are also parsed and created. 

  // var elem2 = Element.html(
  //    '<p>Creating <em>is</em> easy!</p>', 
  // ); 

  // Note that elem2 is a ParagraphElement in the preceding
  // example.
  
  // Attach the newly created element to the document by 
  // assigning a parent to the element. You can add an element
  // to any existing element's children. In the following 
  // example, body is an element, and its child elements
  // are accessible (as a List<Element>) from the children
  // property. 

  // document.body.children.add(elem2); 


  // Adding, replacing, and removing nodes
  // Recall that elements are just a kind of node. You can
  // find all the children of a node using the nodes property
  // of Node, which returns a List<Node> (as opposed to 
  // children, which omits non-Element nodes). Once you have
  // this list, you can use the usual List methods and 
  // operators to manipulate the children of the node. 

  // To add a node as the last child of its parent, use
  // the List add() method:

  // querySelector('#inputs').nodes.add(elem); 

  // To replace a node, use the Node replaceWith() method:

  // querySelector('#status').replaceWith(elem); 

  // To remove a node, use the Node remove() method():

  // Find a node by ID, and remove it from the DOM.
  // querySelector('#expendable').remove(); 


  // Manipulating CSS styles
  // CSS, or cascading style sheets, defines the presentation
  // style of DOM elements. You can change the appearance of 
  // an element by attaching ID and class attributes to it.

  // Each element has a classes field, which is a list. Add 
  // and remove CSS classes simply by adding and removing 
  // strings from this collection. For example, the following
  // sample adds the warning class to an element:

  // var elem = querySelector('#message'); 
  // elem.classes.add('warning'); 

  // It's often very efficient to find an element by ID. You
  // can dynamically set an element ID with the id property:

  // var message = DivElement(); 
  // message.id = 'message2'; 
  // message.text = 
  //    'Please subscribe to the Dart mailing list.'; 
  
  // You can reduce the redundant text in this example by 
  // using method cascades:

  // var message = DivElement()
  //    ..id = 'message2'
  //    ..text = 'Please subscribe to the Dart mailing list.'; 

  // While using IDs and classes to associate an element 
  // with a set of styles is best practice, sometimes you
  // want to attach a specific style directly to the element:

  // message.style
  //     ..fontWeight = 'bold'
  //     ..fontSize = '3em'; 



  // Handling events
  // To respond to external events such as clicks, changes of
  // focus, and selections, add an event listener. You can 
  // add an event listener to any element on the page. Event
  // dispatch and propagation is a complicated subject; 
  // research the details if you're new to web programming.

  // Add an event handler using 
  // element.onEvent.listen(function), where Event is the 
  // event name and function is the event handler. 

  // For example, here's how you can handle clicks on a
  // button:

  // Find a button by ID and add an event handler. 
  // querySelector('#submitInfo').onClick.listen((e) {
  //    // When the button is clicked, it runs this code. 
  //    submitData(); 
  // }); 

  // Events can propagate up and down through the DOM tree.
  // To discover which element originally fired the event, 
  // use e.target:
  // document.body.onClick.listen((e) {
  //    final clickedElem = e.target; 
  // }); 

  // To see all the events for which you can register an
  // event listener, look for "onEventType" properties in
  // the API docs for Element and its subclasses. Some 
  // common events include:
  //    - change
  //    - blur
  //    - keyDown
  //    - keyUp
  //    - mouseDown
  //    - mouseUp
}
