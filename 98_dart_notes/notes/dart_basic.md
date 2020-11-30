# Dart 基础知识

## INDEX

1. Dart 入口方法main方法介绍
2. 重要的概念
3. 关键字
4. 注释
   - 单行注释
   - 多行注释
   - 文档注释
5. Dart 定义变量
    - 默认值
    - Final 和 Const
6. Dart 常量申明
7. Dart 变量命名规则


来源<https://dart.dev/guides/language/language-tour>

## 1. Dart 入口方法main方法介绍

### helloWorld.dart

```dart
main(List<String> args) {
  print('Hello World');
}
```

在终端执行

```barsh
dart helloWorld.dart

\\就能看到Hello World的结果了。
```

### 程序的分析

接下来，就是我自己的总结：

1. Dart语言的入口也是main函数，并且必须显示的进行定义；
2. Dart的入口函数main是没有返回值的；
3. 传递给main的命令行参数，是通过List<String>完成的。
从字面值就可以理解List是Dart中的集合类型。
其中的每一个String都表示传递给main的一个参数；
4. 定义字符串的时候，可以使用单引号或双引号；
5. 每行语句必须使用分号结尾，很多语言并不需要分号，比如Swift、JavaScript；

```dart
void main() {
  print('Hello World');
}

```

void 表示该函数没有返回值

## 2. 重要的概念

在学习 Dart 语言时, 应该基于以下事实和概念：

- 任何保存在变量中的都是一个 对象 ， 并且所有的对象都是对应一个 类 的实例。 无论是数字，函数和 null 都是对象。所有对象继承自 Object 类。
- 尽管 Dart 是强类型的，但是 Dart 可以推断类型，所以类型注释是可选的。 在上面的代码中， number 被推断为 int 类型。 如果要明确说明不需要任何类型， 需要使用特殊类型 `dynamic` 。
- Dart 支持泛型，如 `List <int>` （整数列表）或 `List <dynamic>` （任何类型的对象列表）。

- Dart 支持顶级函数
  例如 main（）， 同样函数绑定在类或对象上（分别是 静态函数 和 实例函数 ）。 
  以及支持函数内创建函数 （ 嵌套 或 局部函数 ） 。

- 类似地， Dart 支持顶级 变量 ， 同样变量绑定在类或对象上（静态变量和实例变量）。 实例变量有时称为字段或属性。
与 Java 不同，Dart 没有关键字 “public” ， “protected” 和 “private” 。 
如果标识符以下划线（_）开头，则它相对于库是私有的。 有关更多信息，参考 库和可见性。

- 标识符 以字母或下划线（_）开头，后跟任意字母和数字组合。

- Dart 语法中包含 表达式（ expressions ）（有运行时值）和 语句（ statements ）（没有运行时值）。 
  例如，条件表达式 condition ? expr1 : expr2 的值可能是 expr1 或 expr2 。 将其与 if-else 语句 相比较，if-else 语句没有值。 一条语句通常包含一个或多个表达式，相反表达式不能直接包含语句。

- Dart 工具提示两种类型问题：警告_和_错误。
  - 警告只是表明代码可能无法正常工作，但不会阻止程序的执行。 
  - 错误可能是编译时错误或者运行时错误。
    - 编译时错误会阻止代码的执行;
    - 运行时错误会导致代码在执行过程中引发 [异常]（#exception）。

## 3. 关键字

## 4. 注释

### 单行注释

单行注释以 // 开始。 所有在 // 和改行结尾之间的内容被编译器忽略。

```dart
// main(List<String> args) {
//  print('Hello World'); 
}
```

### 多行注释

多行注释以 /* 开始， 以 */ 结尾。 所有在 /* 和 */ 之间的内容被编译器忽略 （不会忽略文档注释）。 多行注释可以嵌套。

```dart
/*
main(List<String> args) {
  print('Hello World'); 
}
*/
```

### 文档注释

文档注释可以是多行注释，也可以是单行注释， 文档注释以 /// 或者 /** 开始。 在连续行上使用 /// 与多行文档注释具有相同的效果。

在文档注释中，除非用中括号括起来，否则Dart 编译器会忽略所有文本。 使用中括号可以引用类、 方法、 字段、 顶级变量、 函数、 和参数。 括号中的符号会在已记录的程序元素的词法域中进行解析。

下面是一个引用其他类和成员的文档注释：

```dart
///
///main(List<String> args) {
///  print('Hello World'); 
///}

```

## 5. 变量
 

### Dart 变量

- dart是一个强大的脚本类语言，可以不预先定义变量类型 ，自动会类型推倒
- 可以通过var关键字定义变量
- 可以通过类型来申明变量
- dart里面有类型校验,声明是int，就不能赋值成字符串

```dart
var str='this is var';
String str='this is var';
int str=123;
```

- 注意： var 后就不要写类型 ，  写了类型 不要var   两者都写   var  a int  = 5;  报错

### 默认值

未初始化的变量默认值是 null。
即使变量是数字 类型默认值也是 null，因为在 Dart 中一切都是对象，数字类型 也不例外。

```dart
int lineCount;
assert(lineCount == null);
```

> 提示： 在生产环境代码中 assert() 函数会被忽略，不会被调用。 在开发过程中, assert(condition) 会在非 true 的条件下抛出异常.有关更多信息，参考 Assert.

### 变量命名规则

Dart的命名规则：

1. 变量名称必须由
   - 数字\字母
   - _ 下划线
   - $ 美元符($)
2. 变量的名字是区分大小写的如
   - age和Age是不同的变量
   - 在实际的运用中,也建议,不要用一个单词大小写区分两个变量
3. 注意
   - 标识符开头**不能是数字**
   - 标识符**不能是保留字和关键字(比如if)**
4. 标识符(变量名称)一定要见名思意 ：
   1. 变量名称建议用名词
   2. 方法名称建议用动词  

## 6. Dart 常量申明
### Final 和 Const

使用过程中从来不会被修改的变量， 可以使用 final 或 const, 而不是 var 或者其他类型，

- Final 变量的值只能被设置一次；
- Const 变量在编译时就已经固定 (Const 变量 是隐式 Final 的类型.)
- 最高级 final 变量或类变量在第一次使用时被初始化。

提示： 实例变量可以是 final 类型但不能是 const 类型。 必须在构造函数体执行之前初始化 final 实例变量 —— 在变量声明中，参数构造函数中或构造函数的初始化列表中进行初始化。

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
**如果 Const 变量是类级别的，需要标记为 static const**。 
在这些地方可以使用在编译时就已经固定不变的值，字面量的数字和字符串， 固定的变量，或者是用于计算的固定数字：

```dart
const bar = 1000000; // 压力单位 (dynes/cm2)
const double atm = 1.01325 * bar; // 标准气压
```

Const 关键字不仅可以用于声明常量变量。 
还可以用来创建常量值，以及声明创建常量值的构造函数。 
任何变量都可以拥有常量值。

```dart
var foo = const [];
final bar = const [];
const baz = []; // Equivalent to `const []`
```

声明 const 的初始化表达式中 const 可以被省略。 比如上面的 baz。 有关更多信息，参考 DON’T use const redundantly。

非 Final ， 非 const 的变量是可以被修改的，即使这些变量 曾经引用过 const 值。

```dart
foo = [1, 2, 3]; // 曾经引用过 const [] 常量值。
Const 变量的值不可以修改：

baz = [42]; // Error: 常量变量不能赋值修改。

```
更多关于使用 const 创建常量值，参考 Lists， Maps， 和 Classes。

### Dart 变量命名规则

永远不改量的量，请使用final或const修饰它，而不是使用var或其他变量类型。

Dart 常量final 和 const修饰符  

- const
  值不变 一开始就得赋值
- final
  - 可以开始不赋值
  - 只能赋一次
  - 而final不仅有const的编译时常量的特性，最重要的它是运行时常量，并且final是惰性初始化，即在运行时第一次使用前才初始化

```dart
final name = 'Bob'; // Without a type annotation
final String nickname = 'Bobby';

const bar = 1000000; // Unit of pressure (dynes/cm2)
const double atm = 1.01325 * bar; // Standard atmosphere

final a=new DateTime.now(); // new DateTime.now() 是一个变量，但是final只在运行的时候初始化，所以在运行的时候，a 是一个常亮，并且不在变化
const a=new DateTime.now(); // 这个定义是错误 
```
