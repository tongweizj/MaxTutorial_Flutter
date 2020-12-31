# 12 预处理程序

##本小节知识点

预处理程序
类似快捷方式,帮助程序员更容易的开发\阅读\修改程序.
他们是预先设置好的

```
#define
以#开头
```


## 12.1 #define

### 用法1: \#define 功能就像是文本编辑器里的替换

```
#define TRUE 1    // TRUE = 1
#define FALSE 0   // FALSE = 0

gameOver = TRUE;
// gameOver = 1;
```
注意点
+ 不能对 TRUE 做赋值
+ 字母全大写,视觉上区分预定义的值和其他变量
+ 是替换预定义值**右边的所有字符**

```
#define TRUE 1000;
game = TRUE;
// game = 1000;;
```

### 用法2: 预定义中包含表达式等内容

```
#define TWO_PI 2.0 * 3.141592654
return TWO_PI * radius //周长
```

代表: 表达式
```
#define AND &&
#define OR ||
if(x>0 AND x<10)
...

if(x>0 OR x<10)
...
```

预定义中可以包含另一个预定义值
```
#define PI 3.141592654
#define TWO_PI 2 * PI
```

```
#define IS_LEAP_YEAR year % 4 == 0 && year%100 != 0 || year %400 == 0

- 原表达式
if( year % 4 == 0 && year%100 != 0 || year %400 == 0 )

- 简化后表达式
if(IS_LEAP_YEAR)   //简单,而且易读
```


###  用法3: 宏的应用
宏: 带有一个或多个参数的预定义

```
#define IS_LEAP_YEAR(y) y % 4 == 0 && y % 100 != 0 || y % 400 == 0

- 原表达式
if( year % 4 == 0 && year%100 != 0 || year %400 == 0 )

- 简化后表达式
if(IS_LEAP_YEAR)   //简单,而且易读
```
```
#define SQUARE(x) x * x

y= SQUARE(v) // y=v*v
y= SQUARE(v+1) //y=v+1*v+1

#define SQUARE(x) ((x) * (x))
y= SQUARE(v+1) //y=(v+1)*(v+1)

```

## \#import

把个人编程习惯使用的预定义代码写在一个 .h 文件中
在要使用的文件,在开头 #import 引用就可以

## 预定义的条件编译   

### \#ifdef #endif #else #ifndef

```
#define IPAD
#ifdef IPAD
# define kImageFile @"barnHD.png"
#else
# define kImageFile @"barn.png"
#endif

```
