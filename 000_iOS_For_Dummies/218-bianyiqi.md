# 编译器的指令
##本小节知识:
1. 【理解】什么是@property
2. 【掌握】@property基本使用
3. 【理解】寻找方法的过程
4. 【理解】OC方法查找顺序

---
## 基本知识
- 什么是编译器的指令 ？
    + 编译器指令就是用来告诉编译器要做什么！

- 常见的编译器指令
    + @property
    + @synthesize
    + @property

---


##1.什么是@property
- @property是编译器的指令


- @property会让编译器做什么呢？
    + @property 用在声明文件中告诉编译器声明成员变量的的访问器(getter/setter)方法
    + 这样的好处是:免去我们手工书写getter和setter方法繁琐的代码

---

##2.@property基本使用
- 在@inteface中,用来自动生成setter和getter的声明

```objc
用@property int age;就可以代替下面的两行
- (int)age;   // getter
- (void)setAge:(int)age;  // setter
```

- @property编写步骤

```objc
1.在@inteface和@end之间写上@property
2.在@property后面写上需要生成getter/setter方法声明的属性名称, 注意因为getter/setter方法名称中得属性不需要_, 所以@property后的属性也不需要_.并且@property和属性名称之间要用空格隔开
3.在@property和属性名字之间告诉需要生成的属性的数据类型, 注意两边都需要加上空格隔开
```
---
# @synthesize基本概念
##本小节知识:
1. 【理解】什么是@synthesize
2. 【掌握】@synthesize基本使用
3. 【掌握】@synthesize注意点

---

##1.什么是@synthesize

@synthesize会让编译器做什么呢？
    + @synthesize 用在实现文件中告诉编译器实现成员变量的的访问器(getter/setter)方法
    + 这样的好处是:免去我们手工书写getterr和setter方法繁琐的代码

---

##2.@synthesize基本使用
- 在@implementation中, 用来自动生成setter和getter的实现

```objc
用@synthesize age = _age;就可以代替
- (int)age{
	return _age;
}
- (void)setAge:(int)age{
	_age = age;
}
```

- @synthesize编写步骤

```objc
1.在@implementation和@end之间写上@synthesize
2.在@synthesize后面写上和@property中一样的属性名称, 这样@synthesize就会将@property生成的什么拷贝到@implementation中
3.由于getter/setter方法实现是要将传入的形参 给属性和获取属性的值,所以在@synthesize的属性后面写上要将传入的值赋值给谁和要返回哪个属性的值, 并用等号连接
```

- 以下写法会赋值给谁?

```objc
@interface Person : NSObject
{
    @public
    int _age;
    int _number;
}

@property int age;

@end

@implementation Person

@synthesize age = _number;

@end

int main(int argc, const char * argv[]) {

    Person *p = [Person new];
    [p setAge:30];
    NSLog(@"_number = %i, _age = %i", p->_number, p->_age);

    return 0;
}
```
---

##3.@synthesize注意点
- @synthesize age = _age;
    + setter和getter实现中会访问成员变量_age
    + 如果成员变量_age不存在，就会自动生成一个@private的成员变量_age

- @synthesize age;
    + setter和getter实现中会访问@synthesize后同名成员变量age
    + 如果成员变量age不存在，就会自动生成一个@private的成员变量age

- 多个属性可以通过一行@synthesize搞定,多个属性之间用逗号连接

```objc
@synthesize age = _age, number = _number, name  = _name;

```
---


# @property增强
##本小节知识:
1. 【掌握】@property增强
2. 【掌握】@property增强注意点

---


##1.@property增强
- 自从Xcode 4.x后，@property可以同时生成setter和getter的声明和实现

```objc
@interface Person : NSObject
{
    int _age;
}
@property int age;
@end
```
---

##2.@property增强注意点
- 默认情况下，setter和getter方法中的实现，会去访问下划线 _ 开头的成员变量。

```objc
@interface Person : NSObject
{
    @public
    int _age;
    int age;
}
@property int age;

@end

int main(int argc, const char * argv[]) {

    Person *p = [Person new];
    [p setAge:30];
    NSLog(@"age = %i, _age = %i", p->age, p->_age);

    return 0;
}
```

- 如果没有会自动生成一个_开头的成员变量,自动生成的成员变量是私有变量, 声明在.m中,在其它文件中无法查看,但当可以在本类中查看


- @property只会生成最简单的getter/setter方法,而不会进行数据判断

```objc
Person *p = [Person new];
[p setAge:-10];
NSLog(@"age = %i", [p age]);
```
- 如果需要对数据进行判断需要我们之间重写getter/setter方法
    + 若手动实现了setter方法，编译器就只会自动生成getter方法
    + 若手动实现了getter方法，编译器就只会自动生成setter方法
    + 若同时手动实现了setter和getter方法，编译器就不会自动生成不存在的成员变量

---


