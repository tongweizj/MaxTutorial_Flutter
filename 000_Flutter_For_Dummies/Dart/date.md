声明
var now =new DateTime.now();
print(now);
var d =new DateTime(2019, 1, 10, 9, 30);
print(d);
创建时间UTC
var d = new DateTime.utc(2019, 10, 10, 9, 30);
解析时间 ISO 8601
var d1 = DateTime.parse('2018-10-10 09:30:30Z');
print(d1);
var d2 = DateTime.parse('2018-10-10 09:30:30+0800');
print(d2);
时间增减量
var d1 = DateTime.now();
print(d1);
print(d1.add(new Duration(minutes: 5)));//加五分钟
print(d1.add(new Duration(minutes: -5)));//减五分钟
 时间比较
 var d1 = new DateTime(2018, 10, 1);
  var d2 = new DateTime(2018, 10, 10);
  print(d1.isAfter(d2));//是否在d2之后
  print(d1.isBefore(d2));//是否在d2之前
  var d3 = DateTime.now();
  var d4 = d3.add(new Duration(milliseconds: 30));
  print(d3.isAtSameMomentAs(d4));//是否相同
 时间差
var d1 = new DateTime(2018, 10, 1);
var d2 = new DateTime(2018, 10, 10);
var difference = d1.difference(d2);
print([difference.inDays, difference.inHours]);//d1与d2相差的天数与小时
 时间戳
  var now = new DateTime.now();
  print(now.millisecondsSinceEpoch);//单位毫秒，13位时间戳
  print(now.microsecondsSinceEpoch);//单位微秒,16位时间戳
时间格式化
自己封装下吧

//padLeft(int width,String padding)：如果字符串长度小于width，在左边填充padding
var date = new DateTime.now();
  String timestamp = "${date.year.toString()}-${date.month.toString().padLeft(2,'0')}-${date.day.toString().padLeft(2,'0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
  print(timestamp);
 
 