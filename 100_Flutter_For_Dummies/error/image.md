# 图片相关常见错误


## The argument type 'image' can't be assigned to the parameter type 'imageProvider'

错误代码
```dart
decoration: BoxDecoration(
  image: DecorationImage(
    image: Image.network("http://myurl.com/"+productList[index].thumbnail),
    fit: BoxFit.cover
  )
),
```
正确代码
```dart
decoration: BoxDecoration(
  image: DecorationImage(
    image: NetworkImage("urlImage"),
    fit: BoxFit.cover
  )
),
```