# 4.3 常用控件: UIImageView 介绍
**index**
- 添加图片demo
- 读取图片文件的方法
- 图片设置frame
- 图片的显示模式 contentMode
- 毛玻璃效果
- 动画
- [5.2 图片存储的选择](DATA/image.md) 




## 什么是UIImageView
UIImageView极其常用，
功能比较专一：**显示图片**

## 什么是UIImage
一个UIImage对象代表一张图片对象



## UIImageView常见的属性
```objc
// 显示的图片
@property(nonatomic,retain) UIImage *image; 

```

## 添加图片demo

```objc

// 1.创建UIImageView对象
UIImageView *imageView = [[UIImageView alloc] init];

// 2. 设置尺寸 覆盖全屏
/*  方法1 */
imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

/*  方法2  更简单*/
imageView.frame = self.view.bounds;

// 3. 设置背景颜色
imageView.backgroundColor = [UIColor redColor];

// 4. 设置背景图片
一个UIImage对象代表一张图片，一般通过imageNamed:方法就可以通过文件名加载项目中的图片

imageView.image = [UIImage imageNamed:@"1"];

// 5.设置图片的内容模式
imageView.contentMode = UIViewContentModeScaleAspectFill;

// 加到控制器的view中
[self.view addSubview:imageView];
```

## 读取图片文件的方法

1. imageNamed:
2. imageWithContentsOfFile:

1. 加载Assets.xcassets这里面的图片:
1> 打包后变成Assets.car
2> 拿不到路径
3> 只能通过imageNamed:来加载图片
4> 不能通过imageWithContentsOfFile:来加载图片

2. 放到项目中的图片:
1> 可以拿到路径
2> 能通过imageNamed:来加载图片
3> 也能通过imageWithContentsOfFile:来加载图片
 
详细看这里:[ 点击](DATA/image.md) 
## 图片设置frame

### 方式一 四平八稳
```objc
//1. 创建对象
UIImageView *imageView = [[UIImageView alloc] init];
//2.图片定位的两种方式
imageView.frame = CGRectMake(100, 100, 267, 400);
imageView.frame = (CGRect){{100, 100},{267, 400}};

//3.指定图片文件
imageView.image = [UIImage imageNamed:@"1"];

```

### 方式二
```objc
// 1.创建view
UIImageView *imageView = [[UIImageView alloc] init];
// 2.设置frame
imageView.frame = CGRectMake(100, 10, image.size.width, image.size.height);

// 3.创建一个UIImage对象, 这里和方法一,不一样
UIImage *image = [UIImage imageNamed:@"1"];
imageView.image = image;

```

### 方式三
```objc
// 创建一个view,同时完成位置的设置.把方法2的1,2两步合并
UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 10, image.size.width, image.size.height)];

// 创建一个UIImage对象
UIImage *image = [UIImage imageNamed:@"1"];
imageView.image = image;

```

### 方式四  
这中方法,把方式3,给全合并掉了!
但是这种方法有尺寸,没有位置
```objc

// 1. 创建一个UIimageview对象
//    注意: initWithImage 默认就有尺寸--->图片的尺寸
UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];

// 2.定义位置
// 方法1. 图片中点是一个绝对值定位
imageView.center = CGPointMake(200, 150);

// 方法2. 图片中点在父控件的中点         
imageView.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);

[self.view addSubview:imageView];
}
```

## 设置图片的显示模式 contentMode 

### 显示模式介绍

```objc

UIViewContentModeRedraw, // 重新绘制 (核心绘图) drawRact

//带有Scale,标明图片有可能被拉伸或压缩
UIViewContentModeScaleToFill, // 完全的压缩或拉伸

// Aspect 比例,缩放是带有比例的
UIViewContentModeScaleAspectFit, // 宽高比不变 Fit 适应
UIViewContentModeScaleAspectFill, // 宽高比不变 Fill 填充

//不带有Scale,标明图片不可能被拉伸或压缩

UIViewContentModeCenter  //图片居中
UIViewContentModeTop     //图片居顶
UIViewContentModeBottom  //图片居底
UIViewContentModeLeft    //图片居左
UIViewContentModeRight   //图片居右
UIViewContentModeTopLeft //图片居顶+左
UIViewContentModeTopRight    //图片居顶+右
UIViewContentModeBottomLeft  //图片居底+左
UIViewContentModeBottomRight //图片居底+右
```

### 设置图片的内容模式设定的基本常用代码

```objc
// 1 设置图片的内容模式
imageView.contentMode = UIViewContentModeScaleAspectFill;

// 2 加到控制器的view中
[self.view addSubview:imageView];

// 3. 裁剪多余的部分
imageView.clipsToBounds = YES;

```

## 毛玻璃效果

```objc
// 加毛玻璃

// 1 创建UIToolBar对象
UIToolbar *toolBar = [[UIToolbar alloc] init];

// 2 设置toolBar的frame   尺寸和药覆盖毛玻璃图片的尺寸要一样
toolBar.frame = imageView.bounds;

// 3 设置毛玻璃的样式
toolBar.barStyle = UIBarStyleBlack; //样式
toolBar.alpha = 0.98;  //透明度

// 4 加到imageView中
[imageView addSubview:toolBar];  //添加到要覆盖毛玻璃效果的imageview里面去

```



## UIImageView 动画属性
```objc
// 显示的动画图片
@property(nonatomic,copy) NSArray *animationImages; 

// 动画图片的持续时间
@property(nonatomic) NSTimeInterval animationDuration; 

// 动画的播放次数（默认是0，代表无限播放）
@property(nonatomic) NSInteger animationRepeatCount; 

```

## UIImageView 动画常见方法
```objc
- (void)startAnimating; // 开始动画
- (void)stopAnimating; // 停止动画
- (BOOL)isAnimating; // 是否正在执行动画

```

动画演示
````objc
// 1.1 加载所有的图片
NSMutableArray<UIImage *> *imageArr = [NSMutableArray array];
for (int i=0; i<20; i++) {
    // 获取图片的名称
    NSString *imageName = [NSString stringWithFormat:@"%d", i+1];
    // 创建UIImage对象
    UIImage *image = [UIImage imageNamed:imageName];
    // 加入数组
    [imageArr addObject:image];
}
// 设置动画图片
self.imageView.animationImages = imageArr;

// 设置动画的播放次数
self.imageView.animationRepeatCount = 0;

// 设置播放时长
// 1秒30帧, 一张图片的时间 = 1/30 = 0.03333 20 * 0.0333
self.imageView.animationDuration = 1.0;

// 开始动画
[self.imageView startAnimating];
```

[self.wordsArr addObject:[self readDataFromPath:list[@"name"] andType:@"plist"]];

self.wordsArr = [self readDataFromPath:list[@"name"] andType:@"plist"];