# Number

Dart 语言的 Number 有两种类型:

## int

- 整数
- 位数有限制

整数值不大于64位， 具体取决于平台。 
在 Dart VM 上， 值的范围从 -263 到 263 - 1. Dart 被编译为 JavaScript 时，使用 JavaScript numbers, 值的范围从 -253 到 253 - 1.

## double

- 带小数位
- 位数更多

64位（双精度）浮点数，依据 IEEE 754 标准。

int 和 double 都是 num. 的亚类型。 num 类型包括基本运算 +， -， /， 和 *， 以及 abs()， ceil()， 和 floor()， 等函数方法。 （按位运算符，例如»，定义在 int 类中。） 如果 num 及其亚类型找不到你想要的方法， 尝试查找使用 dart:math 库。

整数类型不包含小数点。 下面是定义整数类型字面量的例子:

var x = 1;
var hex = 0xDEADBEEF;
如果一个数字包含小数点，那么就是小数类型。 下面是定义小数类型字面量的例子:

var y = 1.1;
var exponents = 1.42e5;
从 Dart 2.1 开始，必要的时候 int 字面量会自动转换成 double 类型。

double z = 1; // 相当于 double z = 1.0.
版本提示： 在 2.1 之前，在 double 上下文中使用 int 字面量是错误的。

以下是将字符串转换为数字的方法，反之亦然：

```dart
// String -> int
var one = int.parse('1');
assert(one == 1);

// String -> double
var onePointOne = double.parse('1.1');
assert(onePointOne == 1.1);

// int -> String
String oneAsString = 1.toString();
assert(oneAsString == '1');

// double -> String
String piAsString = 3.14159.toStringAsFixed(2);
assert(piAsString == '3.14');
```

int 特有的传统按位运算操作，移位（<<， >>），按位与（&）以及 按位或（|）。 例如：

assert((3 << 1) == 6); // 0011 << 1 == 0110
assert((3 >> 1) == 1); // 0011 >> 1 == 0001
assert((3 | 4) == 7); // 0011 | 0100 == 0111
数字类型字面量是编译时常量。 在算术表达式中，只要参与计算的因子是编译时常量， 那么算术表达式的结果也是编译时常量。

const msPerSecond = 1000;
const secondsUntilRetry = 5;
const msUntilRetry = secondsUntilRetry * msPerSecond;