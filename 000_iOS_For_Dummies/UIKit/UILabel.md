#4.1 常用控件: Label 介绍

## 什么是UILabel
UILabel极其常用，功能比较专一：显示文字


## UILabel的常见属性

1. 显示的文字
```objc
@property(nonatomic,copy) NSString *text;  

label.text = @"da shen 11期最牛逼!";     // 1.4 设置文字
```

2. 背景颜色

```objc
    label.backgroundColor = [UIColor redColor]; 
    /*
    [UIColor greenColor]  绿色
    [UIColor yellowColor] 黄色
    */
```

3. 文字颜色
```objc
@property(nonatomic,retain) UIColor *textColor; 
label.textColor = [UIColor whiteColor];
```


4. 对齐模式（比如左对齐、居中对齐、右对齐） 
```objc

@property(nonatomic) NSTextAlignment textAlignment; 

label.textAlignment = NSTextAlignmentCenter;     // 1.5 设置文字的对齐方式居中
```

5. 居中
```objc

label.textAlignment = NSTextAlignmentCenter;
```

6. 文字行数
```objc

@property(nonatomic) NSInteger numberOfLines; 
label.numberOfLines = 1;
```

7. 换行模式
```objc

@property(nonatomic) NSLineBreakMode lineBreakMode;

label.lineBreakMode =  NSLineBreakByTruncatingHead;

可供选项:

// 单词包裹,换行的时候会以一个单词换行
NSLineBreakByWordWrapping = 0,  

// 字符包裹换行,换行的时候会以一个字符换行
NSLineBreakByCharWrapping,		

// 裁剪超出的内容
NSLineBreakByClipping,		

// 一行中头部省略(注意:numberOfLines要为1): "...wxyz"
NSLineBreakByTruncatingHead,	

// 一行中尾部省略: "abcd..."
NSLineBreakByTruncatingTail,	

// 一行中中间部省略:  "ab...yz"
NSLineBreakByTruncatingMiddle	

```

8. 设置阴影(默认是有值)
```objc
    label.shadowColor = [UIColor blackColor];
    label.shadowOffset = CGSizeMake(-2, 1);

``` 


## 字体
```objc
@property(nonatomic,retain) UIFont *font;   //UIFont代表字体

// 常见方法
//系统默认字体
+ (UIFont *)systemFontOfSize:(CGFloat)fontSize;   

//粗体
+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize;  

//斜体
+ (UIFont *)italicSystemFontOfSize:(CGFloat)fontSize;  

// 1.6 设置字体大小
label.font = [UIFont systemFontOfSize:20.f]; // 使用系统字体,字号20f
label.font = [UIFont boldSystemFontOfSize:25.f];  // 使用系统粗体字,字号 20f
label.font = [UIFont italicSystemFontOfSize:20.f]; // 使用系统斜体字,字号 20f
```



## 代码创建UILabel对象

* 基本的创建代码
```objc
    // 创建UILabel对象
    UILabel *label = [[UILabel alloc] init];

    // 设置frame (位置和尺寸)
    label.frame = CGRectMake(100, 100, 100, 60);
    label.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, 
<#CGFloat height#>)//(x轴, y轴, view宽, view高)

    // 设置背景颜色
    label.backgroundColor = [UIColor yellowColor];
    
    // 添加到控制器的view中
    [self.view addSubview:label]; 
    self.label = label;
```

