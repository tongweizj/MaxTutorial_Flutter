# Self关键字
####本小节知识点:
1. 类方法中的self
2. 对象方法中的self
3. 全局变量成员变量局部变量
4. self总结
5. self使用注意

---

- OC提􏰀供了两个保留字self和super
    + OC语言中的self,就相当于C++、Java中的this指针。
- 要理解什么是self，什么是成员变量，什么是对象方法，什么是类方法
- 成员变量:成员变量是一个实例对象的具体状态特征，并且这些状态特征是可以改变的，如张三的年龄，身高，体重等
- 对象方法：一个实例对象的行为，比如张三具有吃的行为，张三做出这样行为的时候，有可能会影响，自身的某些状态特征，比如张三吃可能会增加张三体重和身高。
- 类方法：类方法是某个类的行为，可以直接通过类名调用；如果在类方法中需要使用某些数据，必须通过参数传入；它不能访问成员变量。

---
##1.类方法中的self
- 在整个程序运行过程中，`一个类有且仅有一个类对象`。
- 通过`类名`调用方法就是给这个`类对象`发送消息。
- 类方法的self就是这个类对象
- 在类方法中可以通过self来调用其他的类方法
- 不能在类方法中去调用对象方法或成员变量，因为对象方法与成员变量都是属于具体的实例对象的。

// 缺一张配图
---
##2.对象方法中的self
- 在整个程序运行过程中，`对象可以有0个或多个`
- 通过`对象`调用方法就是给这个`对象`发送消息
- 对象方法中self就是调用这个方法的当前对象。
- 在对象方法中，可以通过self来调用本对象上的其他方法
- 在对象方法中，可以通过self来访问成员变量

// 缺一张配图
---
##3.全局变量成员变量局部变量
- 全局变量：只要是有声明它的地方都能使用
- 成员变量：只能在本类和其子类的对象方法中使用
- 局部变量：只能在本函数或方法中使用
- 从作用域的范围来看：全局变量 > 成员变量 > 局部变量
- 当不同的作用域中出现了同名的变量，内部作用域的变量覆盖外部作用域变量，所以同名变量的覆盖顺序为：局部变量覆盖成员变量，成员变量覆盖全局变量
- 如果在对象方法中出现与成员变量同名的局部变量，如果此时想使用该成员变量可以通过self->成员变量名的方式

---

##4.self总结
- 谁调用self所在的方法，那么self就是谁
- self在类方法中，就是这个类的类对象，全局只有一个，可通过self调用本类中的其他类方法，但是不能通过self来调用对象方法或访问成员变量
- self在对象方法中，就是调用这个方法的那个对象， 可以通过self调用本类中其他的对象方法，访问成员变量，但不能通过self调用本类的类方法。

- 通过self调用方法的格式：[self  方法名];
- 通过self访问成员变量格式：self->成员变量名

---

##5.self使用注意
- 同时有对象方法和类方法存在的时候,self不会调错
- self只能在方法中使用;不要使用self来调用函数，也不可以在函数内部使用self；
- 使用self调用本方法，导致死循环调用。

---