import 'dart:json' as json; 

void main() { 
    var jsonPerson = '{"name" : "joe", "date" : [2013, 10, 3]}'; 

    var person = json.parse(jsonPerson, (key, value) { 
    if (key == "date") { 
     return new DateTime(value[0], value[1], value[2]); 
    } 
    return value; 
    }); 

    person['name'];    // 'joe' 
    person['date'] is DateTime; // true 
} 