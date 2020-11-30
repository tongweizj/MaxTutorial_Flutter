#  
## 资料

https://medium.com/flutterworld/flutter-problem-listview-vs-column-singlechildscrollview-43fdde0fa355



``` dart
SingleChildScrollView( 
  child: Column(
    children: <Widget>[
      Container(
        height: 250,
        color: Colors.red[600],
        child: const Center(child: Text('Entry A')),
      ),
      Container(
        height: 250,
        color: Colors.red[500],
        child: const Center(child: Text('Entry B')),
      ),
      Container(
        height: 250,
        color: Colors.yellow[100],
        child: const Center(child: Text('Entry C')),
      ),
    ],
  ),
)
```