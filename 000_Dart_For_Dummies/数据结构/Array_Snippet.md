## Array Snippet



## Access the Index on Dart List.map()



### 问题

Unlike JavaScript, one cannot simply access the index of a list during a `List.map` operation in Dart.

main.dart

```dart
List myList = ['a', 'b', 'c'];

myList.map( (val, index) {
    // This does not work!
    // Which index am I on?
})
```

### 解决

There are several ways to access the index when looping over a List.

#### Use Map Entries

Convert the `List` to a `Map`, then map the [entries](https://api.dartlang.org/stable/2.0.0/dart-core/Map/entries.html) containing the key/value pairs. Each key in the map is the index of the original list.

`main.dart`
```dart
myList.asMap().entries.map((entry) {
    int idx = entry.key;
    String val = entry.value;

    return something;
}
```

#### Generate a Fixed Range List

If you are looping over many lists that have a fixed length, it may be more efficient to generate a single list once. For example, the we create a ranged list that is the same length as the original, i.e. `[0, 1, 2, ..., n]`

```dart
final List fixedList = Iterable<int>.generate(myList.length).toList();


fixedList.map((idx) {
    String val = myList[idx];

    return something;
}
```

#### Grab the Index of Unique Values

You can access the index of a specific value by searching for it with [List.indexOf](https://api.dartlang.org/stable/2.6.1/dart-core/List/indexOf.html), which returns the index of the first match. This approach is most predictable when all values are unique. A [Set](https://api.dartlang.org/stable/2.6.1/dart-core/Set-class.html) can ensure uniqueness throughout the list.

```dart
final List uniqueList = Set.from(myList).toList();

uniqueList.map((val) {
    String idx = uniqueList.indexOf(val);
    return something;
}
```