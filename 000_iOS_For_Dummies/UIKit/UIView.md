#UIView 介绍

## 1. 基本概念
UIView属于UIKIt中的封装控件，只能在iOS使用

### 什么是控件？
- 屏幕上的所有UI元素都叫做控件
也可以叫做: 视图、组件

* 所有的控件最终都继承自UIView
UIButton、UILabel都是继承自UIView（可以查看头文件）

* 控件从父类UIView中继承共同的属性
如:尺寸\位置\背景色

* 按钮（UIButton）、文本（UILabel）都是控件


### 父控件、子控件

* 每一个控件其实都是一个容器
    - 可以将其他控件放到该控件的内部
    - 比较常见的还是将UIView作为容器

* 可以将A控件放入B控件
    - A控件是B控件的子控件
    - B控件是A控件的父控件

* 每一个控制器都有一个UIView
    - 控制器本身是不可见
    - 能够看到的是控制器的View
    - 每一个控制器中都一个UIVIew的属性
    - 控制器中管理的所有子控件都是该控件的子控件

## 2. UIView的常见属性
- 获得自己的父控件对象
```objc
@property(nonatomic,readonly) UIView *superview;
 
NSLog(@"打印当前控件的父控件: %@", self.view.superview);
```

- 获得自己的所有子控件对象
返回值是一个数组,包含了所有子控件对象

```objc
@property(nonatomic,readonly,copy) NSArray *subviews;

NSLog(@"打印当前控件的子控件: %@", self.greenView.subviews);
```

- 获得自己的所有子控件的数量
```objc
NSInteger index = self.shopCarView.subviews.count;
```
- 获得自己的最后一个子控件
```objc
    UIView *lastShopView = [self.shopCarView.subviews lastObject];
```

- 控件的ID(标识)
父控件可以通过tag来找到对应的子控件
```objc
@property(nonatomic) NSInteger tag;
- (UIView *)viewWithTag:(NSInteger)tag;
UIView *redView = [self.view viewWithTag:1];  // 根据tag, 拿self下的, 对应的子控件view
```
tag的常见用法
```objc
- (IBAction)click:(UIButton *)sender {   
    switch (sender.tag) {
        case 100:
        {
            [UIView animateWithDuration:0.3 animations:^{
                _selectCarView.alpha=1;
            }];
        }
            break;
        case 101:
            break;
        default:
            break;
    }
    
}
```
### 编译器标识
#### IBAction
- 只能修饰方法的返回值类型
- 被IBAction修饰的方法
    - 能拖线到storyboard中
    - 返回值类型实际是void

*  使用格式
```objc
- (IBAction)buttonClick
{

}
```

#### IBOutlet
- 只能修饰属性
- 被IBOutlet修饰的属性
    - 能拖线到storyboard中
- 使用格式

```objc
@property (nonatomic, weak) IBOutlet UILabel *label;
```

#### 关于IBAction、IBOutlet前缀IB的解释
- 全称：Interface Builder
- 以前的UI界面开发模式：Xcode3 + Interface Builder
- 从Xcode4开始，Interface Builder已经整合到Xcode中了



## 2. UIKit 坐标系\尺寸

### 坐标系概念
- 在UIKit中，屏幕左上角是坐标系的原点(0，0)
- x值向右正向延伸
- y值向下正向延伸

### 控件的形变属性

可以设置旋转角度、比例缩放、平移等属性
```objc
@property(nonatomic) CGAffineTransform transform;

```

### CGRectMake 控件矩形框在父控件中的位置和尺寸
以父控件的左上角为坐标原点
用来定义新创建的控件,在父控件中的位置
```objc
@property(nonatomic) CGRect frame;

// 创建UILabel对象
UILabel *label = [[UILabel alloc] init];
// 设置frame (位置和尺寸)
label.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat 
height#>)   //(x轴, y轴, view宽, view高)

```

### bounds 控件矩形框的位置和尺寸
以自己左上角为坐标原点，所以bounds的x、y一般为0
```objc
@property(nonatomic) CGRect bounds;
```

### 控件中点的位置
以父控件的左上角为坐标原点
```objc
@property(nonatomic) CGPoint center;

```

### 尺寸\位置的常见操作
```objc
- (IBAction)center {
   // 改变位置
//    self.label.center = CGPointMake(100, 100);
    
    // 显示在最中间
    self.label.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
    
}

- (IBAction)changeFrame {
    // 方式1
//    self.label.frame = CGRectMake(200, 100, 100, 60);
    
    // 方式2
    self.label.frame = (CGRect){{100, 100}, {100, 100}};
    
    // 方式3
    // 结构体是值传递,不是地址传递
//    self.label.frame.size.width += 100;
    CGRect frame = self.label.frame;
//    frame.origin.x -= 100; // 改变x值
//    frame.origin.y += 100; // 改变y值
//    frame.size.width += 50; // 改变宽度
    frame.size.height += 100; // 改变高度
    self.label.frame = frame;
    
}
```


## 3. UIView的常见方法

### 在某一个控件里,添加一个子控件view
```objc
- (void)addSubview:(UIView *)view;
```


###  将自己从父控件中移除
 - 一般就是用于把自己删除
  - 只要控件有父控件,就一定能够移除
```objc
- (void)removeFromSuperview;
[self.view removeFromSuperview];  //self.view 就是要删除的子控件
```

## 4. 控制器
- 概念：凡是继承自UIViewController的对象，都叫做控制器
- 注意：每一个控制器都会专门管理一个软件界面
- 作用：负责处理软件界面的各种事件、负责软件界面的创建和销毁


##5.  类扩展(Class Extension)
- 作用
    - 能为某个类增加额外的属性、成员变量、方法声明
    - 一般将类扩展写到.m文件中
    - `一般将一些私有的属性写到类扩展`
- 使用格式

```objc
@interface 类名()
/* 属性、成员变量、方法声明 */
@end
```
- 与分类的区别
    - 分类的小括号必须有名字
    ```objc
    @interface 类名(分类名字)
    /* 方法声明 */
    @end

    @implementation 类名(分类名字)
    /* 方法实现 */
    @end
    ```
    - 分类只能扩充方法
    - 如果在分类中声明了一个属性，分类只会生成这个属性的get\set方法声明
