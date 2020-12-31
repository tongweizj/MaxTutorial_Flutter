# UIScroll

## 掌握的知识点
* UIScrollView的常见属性
* UIScrollView的常用代理方法
* UIScrollView的缩放
* UIScrollView和UIPageControl的分页
* NSTimer的使用
---
## 1. 基本概念
### 什么是UIScrollView
* 移动设备的屏幕大小是极其有限的，因此直接展示在用户眼前的内容也相当有限
* 当展示的内容较多，超出一个屏幕时，用户可通过滚动手势来查看屏幕以外的内容
* 普通的UIView不具备滚动功能，不适合显示过多的内容
* UIScrollView是一个能够滚动的视图控件，可以用来展示大量的内容，并且可以通过滚动查看所有的内容
* 举例：手机上的“设置”

### UIScrollView的基本使用

#### 用法
* 1/将需要展示的内容添加到UIScrollView中
    * 将需要展示的内容添加到UIScrollView中
    * 设置UIScrollView的contentSize属性，告诉UIScrollView所有内容的尺寸，也就是告诉它滚动的范围（能滚多远，滚到哪里是尽头）

#### UIScrollView显示内容的小细节
* 超出UIScrollView边框的内容会被自动隐藏
* 用户可以用过手势拖动来查看超出边框并被隐藏的内容

### UIScrollView无法滚动的解决办法
可能是以下原因：
* 没有设置contentSize
* scrollEnabled = NO
* 没有接收到触摸事件:userInteractionEnabled = NO

UIScroll有两个对象
- 内容框 scrollView
- 框里面显示的内容 contentSize


## 2. UIScrollView的关于位置的属性

### @property(nonatomic) CGPoint contentOffset; 
这个属性用来表示UIScrollView滚动的位置
（其实就是内容左上角与scrollView左上角的间距值）

### @property(nonatomic) CGSize contentSize; 
这个属性用来表示UIScrollView内容的尺寸，滚动范围（能滚多远）

### @property(nonatomic) UIEdgeInsets contentInset; 
这个属性能够在UIScrollView的4周增加额外的滚动区域，一般用来避免scrollView的内容被其他控件挡住
![](/images/ocDay3/a10/UIScrollView.007.jpeg)

## 3. 其他属性
### @property(nonatomic) BOOL bounces;
设置UIScrollView是否需要弹簧效果

### @property(nonatomic,getter=isScrollEnabled) BOOL scrollEnabled; 
设置UIScrollView是否能滚动

### @property(nonatomic) BOOL showsHorizontalScrollIndicator;
是否显示水平滚动条

### @property(nonatomic) BOOL showsVerticalScrollIndicator;
是否显示垂直滚动条

### 默认下,超出滚动视窗范围的内容是被切割掉的

```objc
-  self.scrollView.clipsToBounds = YES;
// 如果把这个属性值改为no,滚动内容就算超出滚动视窗,也会显示 默认scrollView设置该属性为YES

```

### 2.设置内容尺寸(滚动范围)
可滚动范围 = contentSize尺寸 - scrollView尺寸

**注意点**
- contentSize的尺寸必须大于scrollView的尺寸
- 如果小于等于,那内容是没有滚动效果


## DEMO
```objc

    // 1.红色的view 是一个scrollView  设置起来和普通view没啥区别
    UIView *redView = [[UIView alloc] init];    
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(0, 0, 50, 50);
    [self.scrollView addSubview:redView];
    
    // 2. 设置内容块的尺寸
    self.scrollView.contentSize = CGSizeMake(325, 225);
    
    // 3.是否能够滚动
    // self.scrollView.scrollEnabled = NO;
    
    // 4.是否能够跟用户交互(响应用户的点击等操作)
    // 注意点:设置userInteractionEnabled = NO,scrollView以及内部所有的子控件都不能跟用户交互
    // self.scrollView.userInteractionEnabled = NO;
    
    
    /*
    UIButton *btn = nil;
    btn.enabled = NO;
    btn.userInteractionEnabled = NO;
    
    UIControlStateNormal;
    UIControlStateHighlighted;
    // 注意点:只有设置按钮的enabled = NO才能达到这个状态;
    // 设置按钮的userInteractionEnabled = NO 是达不到这个状态
    UIControlStateDisabled;
     */
}

```