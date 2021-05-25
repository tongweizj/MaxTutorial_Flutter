# Dart 日期时间 DateTime

**1、获取当前时间**

```
var now = new DateTime.now();
print(now); // 2019-06-20 16:59:05.560543
```

**2、设置时间**

```
var d =new DateTime(2019, 6, 20, 16, 37 , 26);
print(d); // 2019-06-20 16:37:26.000
```

**3、创建时间UTC**

```
var ds = new DateTime.utc(2019, 10, 10, 9, 30);
print(ds); // 2019-10-10 09:30:00.000Z
```

**4、解析时间**

```
var d1 = DateTime.parse('2018-10-10 09:30:36');
print(d1); // 2018-10-10 09:30:36.000
var d2 = DateTime.parse('2018-10-10 09:30:30+0800');
print(d2); // 2018-10-10 01:30:30.000Z
```

**5、时间加减**

```
print(now.add(new Duration(minutes: 10)));//加10分钟  2019-06-20 17:09:05.560543
print(now.add(new Duration(minutes: -10)));//减10分钟 2019-06-20 16:49:05.560543

print(now.add(new Duration(hours: 2)));//加2小时 2019-06-20 18:59:05.560543
print(now.add(new Duration(hours: -2)));//减2小时 2019-06-20 14:59:05.560543
```

**6、比较时间**



```
var d3 = new DateTime(2019, 6, 20);
var d4 = new DateTime(2019, 7, 20);
var d5 = new DateTime(2019, 6, 20);

print(d3.isAfter(d4));//是否在d4之后 false
print(d3.isBefore(d4));//是否在d4之前 true 
print(d3.isAtSameMomentAs(d5));//是否相同 true
```



**7、计算时间差**

```
var d6 = new DateTime(2019, 6, 19, 16 , 30);
var d7 = new DateTime(2019, 6, 20, 15, 20);
var difference = d7.difference(d6);
print([difference.inDays, difference.inHours,difference.inMinutes]);//d6与d7相差的天数与小时,分钟 [0, 22, 1370]
```

**8、时间戳**

```
print(now.millisecondsSinceEpoch);//单位毫秒，13位时间戳  1561021145560
print(now.microsecondsSinceEpoch);//单位微秒，16位时间戳  1561021145560543
```

**9、打印当前时间**

```
// padLeft(int width,String sring)：如果字符串长度小于width，在左边填充sring
print("${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}");
// 2019-06-20 16:59:05
```