//
// dart:core Library
// Original website:
// https://dart.dev/guides/libraries/library-tour#dates-and-times
// 

// Dates and times
// A DateTime Object is a point in time. The time zone is either
// UTC or the local time zone.
void datesAndTimes() {
  
  // You can create DateTime objects using several constructors.

  // Create a new DAteTime with the local time zone. 
  var now = DateTime.now(); 
  var y2k = DateTime(2000); // Jan. 1st, 2000
  y2k = DateTime(2000, 1, 2); // Jan. 2nd, 2000

  // Specify the date as a UTC time.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

  // Specify a date and time in ms since the Unix epoch. 
  y2k = 
    DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true); 
  // 2000-01-01 00:00:00.000Z

  // Parse an ISO 8601 date.
  y2k = DateTime.parse('2000-01-01T00:00:00Z');
  

  // The millisecondsSinceEpoch property of a date returns the 
  // number of milliseconds since the "Unix epoch" - Jan. 1st, 
  // 1970, UTC.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC
  print(y2k.microsecondsSinceEpoch); // 946684800000000

  var unixEpoch = DateTime.utc(1970); 
  print(unixEpoch.millisecondsSinceEpoch); // 0
  

  // Use the Duration class to calculate the difference between
  // two dates and to shift a date forward or backward.  
  y2k = DateTime.utc(2000); 

  // Add one year. 
  var y2001 = y2k.add(Duration(days: 366)); 
  print(y2001.year); // 2001

  var december2000 = y2001.subtract(Duration(days: 30)); 
  print(december2000.year); // 2000
  print(december2000.month); // 12

  // Calculate the difference between two dates. 
  // Returns a Duration object.
  // Warning: using a Durarion to shft a Datetime by days can be
  // problematic, due to clock shifts (to daylight saving time, 
  // for example). Use UTC dates if you must shift days. 
  var duration = y2001.difference(y2k); 
  print(duration.inDays); // 366
}