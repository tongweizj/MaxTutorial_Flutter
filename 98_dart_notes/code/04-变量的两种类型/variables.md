# variables 变量

## 知识点

1. Default value
2. Final and const

- 弱类型
  - 动态定义 dynamic
  - 动态定义 Object
  - 比较 var、dynamic、Object
- 强类型
    -常用强类型
    -默认值



## 变量

创建一个变量并进行初始化:

```dart
var name = 'Bob';
```

变量仅存储对象引用，这里的变量是 name 存储了一个 String 类型的对象引用。
“Bob” 是这个 String 类型对象的值。

name 变量的类型被推断为 String 。 但是也可以通过指定类型的方式，来改变变量类型。 如果对象不限定为单个类型，可以指定为 对象类型 或 动态类型， 参考 设计指南。

```dart
dynamic name = 'Bob';
```

另一种方式是显式声明可以推断出的类型：

```dart
String name = 'Bob';
```

**提示： 本页局部变量遵守 风格建议指南 使用 var。 没有使用指定类型的方式**

### 默认值

**未初始化的变量默认值是 null。**

即使变量是数字 类型默认值也是 null，因为在 Dart 中一切都是对象，数字类型 也不例外。

```dart
int lineCount;
assert(lineCount == null);
```

提示： 在生产环境代码中 assert() 函数会被忽略，不会被调用。 在开发过程中, assert(condition) 会在非 true 的条件下抛出异常.有关更多信息，参考 Assert.

### Final 和 Const

**使用过程中从来不会被修改的变量**

可以使用 final 或 const, 而不是 var 或者其他类型

- Final 变量的值只能被设置一次
- Const 变量在编译时就已经固定 (Const 变量 是隐式 Final 的类型.)
- 最高级 final 变量或类变量在第一次使用时被初始化。

提示： 实例变量可以是 final 类型但不能是 const 类型。 
必须在构造函数体执行之前初始化 final 实例变量 —— 在变量声明中，参数构造函数中或构造函数的初始化列表中进行初始化。

创建和设置一个 Final 变量：

```dart
final name = 'Bob'; // Without a type annotation
final String nickname = 'Bobby';
```

final 不能被修改:

```dart
name = 'Alice'; // Error: 一个 final 变量只能被设置一次。
```

如果需要在编译时就固定变量的值，可以使用 const 类型变量。
如果 Const 变量是类级别的，需要标记为 static const。

在这些地方可以使用在编译时就已经固定不变的值，字面量的数字和字符串， 固定的变量，或者是用于计算的固定数字：

```dart
const bar = 1000000; // 压力单位 (dynes/cm2)
const double atm = 1.01325 * bar; // 标准气压
```

Const 关键字不仅可以用于声明常量变量。 还可以用来创建常量值，以及声明创建常量值的构造函数。

任何变量都可以拥有常量值。

```dart
var foo = const [];
final bar = const [];
const baz = []; // Equivalent to `const []`

baz = [42]; // Error: 常量变量不能赋值修改。
```

声明 const 的初始化表达式中 const 可以被省略。 比如上面的 baz。 有关更多信息，参考 DON’T use const redundantly。

### 非 Final

非 const 的变量是可以被修改的，即使这些变量 曾经引用过 const 值。

```dart
foo = [1, 2, 3]; // 曾经引用过 const [] 常量值。
Const 变量的值不可以修改：
```

更多关于使用 const 创建常量值，参考 Lists， Maps， 和 Classes。

