# description方法
##本小节知识点:
1. 【掌握】description基本概念
2. 【掌握】description重写的方法
3. 【了解】description陷阱


---
##1.description基本概念
- NSLog(@"%@", objectA);这会自动调用objectA的description方法来输出ObjectA的描述信息.

- description方法默认返回对象的描述信息(默认实现是返回类名和对象的内存地址)

- description方法是基类NSObject 所带的方法,因为其默认实现是返回类名和对象的内存地址, 这样的话,使用NSLog输出OC对象,意义就不是很大,因为我们并不关心对象的内存地址,比较关心的是对象内部的一些成变量的值。因此,会经常重写description方法,覆盖description方法 的默认实现

---

##2.description重写的方法
- 对象方法

```objc
/**对象方法：当使用NSLog输出该类的实例对象的时候调用*/
-(NSString *) description
{
    return [NSString stringWithFormat:@"狗腿数:%d,狗眼数%d\n",_legNum,_eyeNum];
}
```
- 类方法

```objc
/**类方法：当使用NSLog输出该类的类对象的时候调用*/
+(NSString *) description
{
    return @"+开头的description方法";
}
```
---

##3.description陷阱
- 千万不要在description方法中同时使用%@和self,下面的写法是错误的

```objc
- (NSString *)description {
    return [NSString stringWithFormat:@"%@", self];
}
```
- 同时使用了%@和self,代表要调用self的description方法,因此最终会导致程序陷入死循环,循环调用description方法

- 当[NSString stringWithFormat:@“%@”, self]; 使用它时，循环调用，导致系统会发生运行时错误。

- 当该方法使用NSLog(“%@”,self)  时候， 系统做了相关的优化，循坏调用3次后就会自动退出

---
