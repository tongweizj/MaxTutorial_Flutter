# 日期类型数据的常见操作方法

近期在研究 `Dart` 源码， 把关于 `Date` 这一块写个文章进行整理分享。

在 `Dart` 中操作日期通过 `DateTime` 类来实现。

由于 `DateTime` 是 `Dart` 内置的，所以不需要导入。

# 1. 解析日期

- DateTime
- DateTime.parse
- DateTime.tryParse
- DateTime.utc

## 1.1.  `DateTime.parse` 静态方法

解析一个日期可以通过 `DateTime.parse` 静态方法

一个典型的例子：

```dart
String str = '2020-02-20 22:48:18';
DateTime date = DateTime.parse(str);

print(date);  // 2020-02-20 22:48:18.000

// 解析时间 ISO 8601
var d1 = DateTime.parse('2018-10-10 09:30:30Z');
print(d1);

var d2 = DateTime.parse('2018-10-10 09:30:30+0800');
print(d2);
```

## 1.2. 支持格式

`parse` 参数接收一个字符串, 能够被解析的有以下格式：

```
/**
  * "2012-02-27 13:27:00"
  * "2012-02-27 13:27:00.123456789z"
  * "2012-02-27 13:27:00,123456789z"
  * "20120227 13:27:00"
  * "20120227T132700"
  * "20120227"
  * "+20120227"
  * "2012-02-27T14Z"
  * "2012-02-27T14+00:00"
  * "-123450101 00:00:00 Z"
  * "2002-02-27T14:00:00-0500"
  */
```

1.2.  `DateTime.tryParse` 静态方法

`parse` 方法还有一个对应的 `tryParse` 的静态方法, 实际上就是 `parse` 的语法糖

```
tryParse` 如果接收的参数无法被解析那么不会抛出异常，而是返回 `null
```

`tryParse` 的内部实现原理：

```
try {
  return parse(formattedString);
} on FormatException {
  return null;
}
```

还可以通过 `DateTime` 实例进行解析, 可以接收8个参数，第一个是年份必填，剩余的是选填，如下：

```
/**
 *  DateTime(int year,
 *     [int month = 1,
 *     int day = 1,
 *     int hour = 0,
 *     int minute = 0,
 *     int second = 0,
 *     int millisecond = 0,
 *     int microsecond = 0])
 */
DateTime date = DateTime(2020);

// 2020年2月22日 22小时22分22秒
DateTime date2 = DateTime(2020, 2, 22, 22, 22, 22);
```

如果想解析成 `utc` , 可以调用它的静态方法，参数和 `DateTime` 一致

```
DateTime date1 = DateTime.utc(2020, 2, 22, 22, 22, 22);
```

# 2. 取得时间的各种形态

## 2.1. 日期

```
// 取当前时间
DateTime n = DateTime.now();
print(n);   // 2020-02-20 23:05:04.332418

// 取特定时间
var d =new DateTime(2019, 1, 10, 9, 30);
print(d);

// 创建时间UTC
var d = new DateTime.utc(2019, 10, 10, 9, 30);
```

## 2.2. 时间戳

取得一个以毫秒时间戳

```
int t = DateTime.now().millisecondsSinceEpoch;
print(t);  // 1582211214849

now = new DateTime.now();
print(now.millisecondsSinceEpoch);//单位毫秒，13位时间戳
print(now.microsecondsSinceEpoch);//单位微秒,16位时间戳
```

取得一个以微秒时间戳

```
int t = DateTime.now().microsecondsSinceEpoch;
print(t);  // 1582211566844552
```

取得当前时区

```
String timeZone = DateTime.now().timeZoneName;
print(timeZone);
```

取得一周的星期几

```
int w = DateTime.now().weekday;
print(w);  // 4
```

取得当前时区的偏移时差 （北京时区是东八区，领先UTC八个小时）

```
Duration offset = DateTime.now().timeZoneOffset;
print(offset);    // 8:00:00.000000
```

取得当前年份

```
int year = DateTime.now().year;
print(year);      // 2020
```

取得当前月份 （1-12）, 这跟JS里有点不同

```
int month = DateTime.now().month;
print(month);      // 2
```

取得当前月份的第几天 （1-31）

```
int day = DateTime.now().day;
print(day);      // 21
```

取得当前小时 （0-23）

```
int hour = DateTime.now().hour;
print(hour);      // 8
```

取得当前分钟 （0-59）

```
int minute = DateTime.now().minute;
print(minute);      // 18
```

取得当前秒 （0-59）

```
int second = DateTime.now().second;
print(second);      // 18
```

取得当前毫秒 （0-999）

```
int millisecond = DateTime.now().millisecond;
print(millisecond);      // 249
```

取得当前微秒 （0-999）

```
int microsecond = DateTime.now().microsecond;
print(microsecond);      // 249
```

# 3. 显示不同格式的时间

- toString
- toIso8601String
- toLocal
- toUtc

**`toString`** 要把一个 `DateTime` 转换成时间可以使用 `toString` 方法

```
String str = DateTime.now().toString();
print(str);     // 2020-02-22 01:01:01.182096
```

**`toIso8601String`** 转换成 [ISO 8601](https://baike.baidu.com/item/ISO 8601)

```
String str = DateTime.now().toIso8601String();
print(str);   // 2020-02-22T22:12:30.159729
```

**`toLocal`** 在本地时区返回此DateTime值

```
DateTime date = DateTime.now().toLocal();
print(date);   // 2020-02-22 22:27:57.641258
```

**`toUtc`** 在UTC时区中返回此DateTime值

```
DateTime date = DateTime.now().toUtc();
print(date);   // 2020-02-22 03:27:09.564188Z
```

# 4. 操作



- add() 通过增加时间来改变原始的 DateTime
- subtract() 通过减去时间来改变原始的 DateTime

`add()` 参数接收的是 `Duration` 类型, 下面例子由原来的 `0小时` 新增了 1小时

```
Duration oneHours = Duration(hours: 1);
String date = DateTime(2020).add(oneHours).toString();
print(date);    // 2020-01-01 01:00:00.000

// 时间增减量
var d1 = DateTime.now();
print(d1);

//加五分钟
print(d1.add(new Duration(minutes: 5)));

//减五分钟
print(d1.add(new Duration(minutes: -5)));
```

`subtract()` 是 `add()` 反向操作, 用法跟 `add` 一致，不再阐述。

# 5. 查询和比较



- isBefore
- isAfter
- isAtSameMomentAs
- compareTo

## 5.1 时间差

```code

// 时间差
var d1 = new DateTime(2018, 10, 1);
var d2 = new DateTime(2018, 10, 10);
var difference = d1.difference(d2);
print([difference.inDays, difference.inHours]);//d1与d2相差的天数与小时
```



## 5.2 时间比较先后

**isBefore** 检查一个 `DateTime` 是否在另一个 `DateTime` 之前

```
DateTime date1 = DateTime(2020);
DateTime date2 = DateTime(2019);

print(date1.isBefore(date2));   // false

// 时间比较
var d1 = new DateTime(2018, 10, 1);
var d2 = new DateTime(2018, 10, 10);
print(d1.isAfter(d2));//是否在d2之后
print(d1.isBefore(d2));//是否在d2之前
var d3 = DateTime.now();
var d4 = d3.add(new Duration(milliseconds: 30));
print(d3.isAtSameMomentAs(d4));//是否相同

```

**isAfter** 检查一个 `DateTime` 是否在另一个 `DateTime` 之后

```
DateTime date1 = DateTime(2020);
DateTime date2 = DateTime(2019);

print(date1.isAfter(date2));   // true
```

**isAtSameMomentAs** 如果此事件与other同时发生，则返回true.

```
DateTime date1 = DateTime(2020);
DateTime date2 = DateTime(2019);

print(date1.isAtSameMomentAs(date2));   // false
```

**compareTo** 判断2个 `DateTime` 是否相等，如果相等则返回 `0` 否则 `1`

```
DateTime date1 = DateTime(2020);
DateTime date2 = DateTime(2020);

print(date1.compareTo(date2));   // 0
```

 