# OC 类

##知识点
1. 如何声明一个类
2. 如何实现一个类
3. 如何创建一个对象
4. 对象的注意点

---

## 1.定义类的方法

写声明和实现两部分


##1.如何声明一个类
- 格式
![](/images/ocDay1/a6/smygl.png)

- 变量声明注意：
    + 1.必须以@interface开头，@end结尾
    + 2.成员变量的声明，必须写在@interface与@end之间的大括号中
    + 3.{} 里写成员变量，名称前面都加上_


- 方法声明注意：
+ 1.方法的声明必须在{}下面，不能写在{}中
+ 2.OC中的方法, 如果没有形参不需要写(), 而是直接写一个;
+ 3.OC方法中的()是用来扩住数据类型



##2.如何实现一个类

编写OC方法的规律:
1. 确定方法名称
2. 确定形参
3. 确定返回值
4. 确定返回值类型



- 格式

```objc
@implementation MyClass

- (id)initWithString:(NSString *)aName
{
    //写代码处
}

+ (MyClass *)myClassWithString:(NSString *)aName
{
    //写代码处
}

@end

```
- 注意：
    + 1.必须以@implementation开头，@end结尾
    + 2.类名必须和声明的一致

##### 对象方法




######1.对象方法声明

![](/images/ocDay1/a7/xxffsm.png)

- 特征
    + 对象方法以-开头如 -(void)xx;
    + 对象方法只能由对象来调用,必须创建对象，后才可以调用
    + 对象方法中可以访问当前对象的成员变量
    + 调用格式 [对象名 对象方法名];
    + 在对象方法的代码中，可以直接调用其它**对象方法和类方法**




- 示例

```objc
//声明没有返回值的对象方法
- (void)method;
//声明有返回值的对象方法
- (int)method;
//声明有返回值有参数的对象方法
- (int)method: (int)var;
//声明有返回值有多个参数的对象方法
- (int)method: (int)var1 andVar2: (int)var2;

```


######2.对象方法实现

    + 必须写在以@implementation开头，@end之间
    + 在声明的后面加上{}即表示实现
    + 将需要实现的代码写在{}中




##### 类方法


######1.类方法声明

- 特征
    + 类方法以+开头 如+(void)put;
    + 类方法只能由类来调用
    + 类方法中不能访问实例(成员)变量,因为类方法由类来调用,并没有创建存储空间来存储类中的成员变量。

- 类方法的好处:
    + 节省内存空间
    + 不依赖于对象,执行效率更高;
    + 能用类方法解决的问题,尽量使用类方法;

- 类方法的场合:
    + 当方法内部不需要使用到成员变量时,可以改为类方法
    + 类方法一般用于编写工具方法

- 示例

```objc
//声明没有返回值的类方法
+ (void)method;
//声明有返回值的类方法
+ (int)method;
//声明有返回值有参数的类方法
+ (int)method: (int)var;
//声明有返回值有多个参数的类方法
+ (int)method: (int)var1 andVar2: (int)var2;
```


---

######2.类方法实现
    + 必须写在以@implementation开头，@end之间
    + 在声明的后面加上{}即表示实现
    + 将需要实现的代码写在{}中



#######3.对象方法和类方法区别

- 对象方法
    + 对象方法是属于对象的
    + 以减号-开头
    + 只能让对象调用，没有对象，这个方法根本不可能被执行
    + 对象方法能访问实例变量（成员变量）
    + 对象方法中可以调用当前对象的对象方法
    + 对象方法中可以调用其他对象的对象方法
    + 对象方法中不可以调用类方法
- 类方法
    + 类方法是属于类的
    + 以加号+开头
    + 只能用类名调用，对象不能调用
    + 类方法中不能直接访问实例变量（成员变量）
    + 类方法中不能直接调用对象方法，要想调用对象方法，必须创建或传入对象。

- 使用场合：
    + 当不需要访问成员变量的时候，尽量用类方法

- 类方法和对象方法可以同名

* 以+开头
* 不可以直接访问对象的属性
* 不用创建对象，直接调用
* 类方法代码中不可以直接调用对象方法
* 可以类方法

##### 方法定义的注意点
* 方法名采用 驼峰命名
* 方法中的数据类型都必须使用\(\)括起来
* 方法中每个参数的数据类型前面都必须加上:
* :也是方法名的一部分


##3.如何创建一个对象
- 用类的方式告诉计算机，我们需要一个什么样的对象，之后我们要在程序中使用这个对象，就必须先创建一个对象

![](/images/ocDay1/a6/cjygl.png)

- 注意[Car new];做了三件事
    + 1.在堆内存中开辟了一块新的存储空间
    + 2.初始化成员变量(写在类声明大括号中的属性就叫成员变量,也叫实例变量)
    + 3.返回指针地址

- 消息机制
    + 使用对象调用方法就是OC中的消息机制
    + OC中调用方法的格式：[类名或者对象名 方法名];
![](/images/ocDay1/a6/xxjz.png)


##4.对象的注意点
- 可以通过 对象->对象成员(注意声明属性为:@public) 的方式访问对象中的成员,
- 每一个对象中都有一份属于自己的属性。
- 对其中一个对象的成员进行了修改。和另一个对象没有关系


## 函数与方法对比
- 对象方法:
    + (1)对象方法的实现只能写在@implementation...@end中,对象方法的声明只能写在 @interface...@end中间
    + (2)对象方法都以-号开头,类方法都以+号开头
    + (3)对象方法只能由对象来调用,类方法只能由类来调用,不能当做函数一样调用
    + (4)函数属于整个文件,可以写在文件中的任何位置,包括@implementation...@end中,但写在 @interface...@end会无法识别,函数的声明可以在main函数内部也可以在main函数外部。
    + (5)对象方法归类\对象所有
- 函数:
    + (1)所有的函数都是平行的
    + (2)函数不存在隶属关系
    + (3)使用的时候可以直接调用
    + (4)不可以访问对象中的成员变量


## 常见错误

- 1)@interface @end和@implementation @end不能嵌套包含
- 2) OC是弱语法,可以只有@implementation,但实际开发中千万不要这样。
- 4）漏写@end
- 5）两个类的对象声明顺序(可以把顺序打乱)
- 6）成员变量没有写在{}里
- 7）方法的声明写在了{}里面
- 8）在声明时不能对类的成员变量进行初始化,请注意成员变量不能脱离对象而独立存在
- 9）方法无法像函数那样的调用
- 10）成员变量和方法不能用static等关键字修饰,不要和c语言混淆
- 11）类的实现可以写在mian函数后面,在使用之前只要有声明就可以



## 具体使用
```objc
//方法定义+标签
- (int)sendMessageWithNumber:(int)number andContent:(char *)content
{
    NSLog(@"发短信给%i, 内容是%s", number, content);
    return 1;
}
@end

//方法调用
Iphone *p = [Iphone new];
[p sendMessageWithNumber:123456789 andContent:"hi"];


```

其实就是 把第一个参数的标签写到方法名里面



---
## 7.1 分离接口和实现文件

### 类文件
+ class.h   类声明\类接口 @interface
+ class.m   类定义\类实现 @implementation
+ main




## 7.2 存取（getter/setter）方法


---

getter-setter方法格式和写法都是固定的
是程序员之间的一种规范,降低程序员之间的沟通成本


### 1.setter方法
- 作用：用来设置成员变量，可以在方法里面过滤掉一些不合理的值
- 好处
    + 数据不暴露在外,保证了数据的安全性
    + 对设置的数据进行过滤


- 命名规范：
    + 必须是对象方法
    + 返回值类型为void
    + 方法名必须以set开头，而且后面跟上成员变量名去掉”_” 首字母必须大写
    + 必须提供一个参数，参数类型必须与所对应的成员变量的类型一致
    + 形参名称和成员变量去掉下划线相同

- 举例：
```objc
如：如果成员变量为int _age 那么与之对应seter方法为
-(void) setAge: (int) age;
```


### 2.getter方法
- 作用：为调用者返回对象内部的成员变量的值
- 优点：
    + 可以让我们在使用getter方法获取数据之前,对数据进行加工；
    + 比如双十一活动，我们希望对全线商品的价格在原来的价格基础上打五折，那么我们只要去改成品类的价格的getter方法就可以了，让他返回的值为价格 * 0.5


- 命名规范：
    + 必须是对象方法
    + 必须有返回值,返回值的类型和成员变量的类型一致
    + 方法名必须是成员变量去掉下划线
    + 一定是没有参数的

- 举例

```objc
如：如果成员变量为int _age 那么与之对应geter方法为
- (int) age;
```





### 3.getter/setter方法注意
- 在实际的开发中,不一定set和get方法都会提􏰀供,如果内部的成员变量,比如学生的学号或计算出来的数据。这样的数据只允许外界读取，但是不允许修改的情况,则通常只提􏰀供get方法而不􏰀提供set方法
。

- 成员变量名的命名以下划线开头,get方法名不需要带下划线

- 成员变量名使用下划线开头有两个好处
    + 与get方法的方法名区分开来
    + 可以和一些其他的局部变量区分开来,下划线开头的变量,通常都是类的成员变量。当我看到以下划线开头变量，那么他一定是成员变量

### 4. 合成存取方法



```
#Fraction.h
#import <Foundation/Foundation.h>


@interface Fraction: NSObject
{
    int numerator;
    int denominator;
}

@property int numerator;
@property int denominator ;
-(void) print;
//-(void) setNumerator: (int) n;
//-(void) setDenominator: (int) d;
//
//-(int) numerator;
//-(int) denominator;
-(double) convertToNum;

@end

```




```
#Fraction.m
#import "Fraction.h"


@implementation Fraction
@synthesize numerator ;
@synthesize denominator  ;

-(void) print
{
    NSLog( @" %i/%i ", numerator, denominator);
}
//
//-(void) setNumerator: (int) n
//{
//    numerator = n;
//}
//-(void) setDenominator: (int) d
//{
//    denominator = d;
//}
//-(int) numerator{
//    return numerator;
//}
//-(int) denominator
//{
//    return denominator;
//}

-(double) convertToNum
{
    if (denominator !=0)
        return (double) numerator / denominator;
    else
        return NAN;
}
@end

```
