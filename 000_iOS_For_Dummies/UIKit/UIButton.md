#4.2 常用控件: UIButton 介绍

## 主要内容 
- 按钮的作用
- 按钮的状态
- 按钮的样式
- 获取按钮属性
- 按钮的常见设置方法
- 代码创建按钮实例


## 按钮的作用
- 可以和用户交互
- 既能显示图片,也能显示文字
- 还能随时调整内部图片和文字的位置

## 按钮的状态

### normal  普通状态
这个是按钮的默认情况: Default

- 对应的枚举常量：UIControlStateNormal

### highlighted（高亮状态）
按钮被按下去的时候（手指还未松开）

- 对应的枚举常量：UIControlStateHighlighted

### disabled（失效状态，不可用状态）
如果enabled属性为NO，就是处于disable状态，代表按钮不可以被点击

```objc
self.removeButton.enabled = YES; //按钮可用
self.removeButton.enabled = NO; //按钮不可用
```

- 对应的枚举常量：UIControlStateDisabled


## 按钮的样式
实际上，UIButton自带了很多种不同的样式

* 在用代码创建按钮的同时指定按钮样式

```objc
// 按钮类型,代码写法
UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom]; 

// 类型枚举
UIButtonTypeCustom：无类型，按钮的内容需要自定义
UIButtonTypeDetailDisclosure： 
UIButtonTypeInfoLight： 
UIButtonTypeInfoDark： 
UIButtonTypeContactAdd： 
```



## 按钮的常见设置方法
所有设置的属性,都可以根据按钮状态来单独设置不同的内容

```objc
//设置按钮的文字
- (void)setTitle:(NSString *)title forState:(UIControlState)state;

//设置按钮的文字颜色
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;

//设置按钮内部的小图片
- (void)setImage:(UIImage *)image forState:(UIControlState)state; 

//设置按钮的背景图片
- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state;

//设置按钮的文字字体（需要拿到按钮内部的label来设置）
btn.titleLabel.font = [UIFont systemFontOfSize:13];
```

## 获取按钮属性

```objc
//获得按钮的文字
- (NSString *)titleForState:(UIControlState)state; 

//获得按钮的文字颜色
- (UIColor *)titleColorForState:(UIControlState)state;

//获得按钮内部的小图片
- (UIImage *)imageForState:(UIControlState)state;

//获得按钮的背景图片
- (UIImage *)backgroundImageForState:(UIControlState)state;


```

## 代码创建按钮实例


### 创建按钮对象
方法 1
```objc
// 1.1 创建按钮对象
UIButton *button = [[UIButton alloc] init];
// 1.2 设置按钮的类型
// 注意:设置按钮的类型只能在初始化的时候设置
//    用init初始化那就是默认值  -> UIButtonTypeCustom


// button.buttonType = UIButtonTypeInfoDark;  这个代码是错的,buttonType是只读的
```
方法 2 在初始化的时候设置按钮类型
```objc

UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
```

### 按钮基本属性设置
```objc
// 1.3 设置frame
button.frame = CGRectMake(100, 100, 170, 60);

// 1.4 设置背景颜色的两个方法
//    button.backgroundColor = [UIColor redColor];
//    [button setBackgroundColor:[UIColor redColor]];

// 1.5 设置文字
// 分状态的:
//    button.titleLabel.text = @"普通文字";
[button setTitle:@"普通按钮" forState:UIControlStateNormal];
[button setTitle:@"高亮按钮" forState:UIControlStateHighlighted];

// 1.6 设置文字的颜色
[button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
[button setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];

// 1.7 设置文字的阴影颜色
[button setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
[button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

button.titleLabel.shadowOffset = CGSizeMake(3, 2);

// 1.8 设置内容图片
[button setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:UIControlStateNormal];
[button setImage:[UIImage imageNamed:@"player_btn_pause_highlight"] forState:UIControlStateHighlighted];

//    button.imageView.backgroundColor = [UIColor purpleColor];

// 1.9 设置背景图片
[button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
[button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];

// 2.0 加到控制器的view中
[self.view addSubview:button];

// 非常重要
/**
    *  监听按钮的点击
    *  Target: 目标 (让谁做事情)
    *  action: 方法 (做什么事情-->方法)
    *  Events: 事件
    */
//    SEL sel = @selector(clickButton:);
[button addTarget:self action:@selector(demo:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)demo:(UIButton *)btn{
NSLog(@"%@", btn);
}


- (IBAction)clickButton:(UIButton *)button {
button.enabled = NO;
}

@end
```