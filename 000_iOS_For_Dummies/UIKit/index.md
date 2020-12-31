# UIKit组件笔记

为了便于开发者打造各式各样的优秀App，UIKit框架提供了非常多功能强大又易用的UI控件
以下列举一些在开发中可能用得上的UI控件：

## 索引
   - [4.0 UIView](UIKit/UIView.md) 
   - [4.1 UILabel](UIKit/UILabel.md)
   - [4.2 UIButton](UIKit/UIButton.md) 
   - [4.3 UITextField](UIKit/2.md)
   - [4.4 UIImageView](UIKit/3.md)
   - [4.5 UIImageView动画 animation](UIKit/4.md)
   - [4.6 UIScroll](UIKit/UIScroll.md)


   - [4.8 Xib](UIKit/xib.md) 
   - [4.9 UITableView](UIKit/UITableView.md) 
   - [4.6 其他使用较少的控件](UIKit/other.md)
      - UISwitch  
      - UISegmentedControl
      - UIAlertController

### 布局 
   - [StoryBoard](UIKit/storyboard.md) 
   - [Layout Anchors](/iOS/UIKit/LayoutAnchors.md) 

---

## 1. UIView
1. UIView介绍和父子控件
2. UIView的常见方法
3. 控件引用weak
4. UIView的frame-bounds-center属性
5. UIView的常见属性


## 2. 最常用控件
iOS中控件的用法都是相似相通的，掌握最主要、最常用的控件，就可以快速上手其他控件

###  UIButton 按钮
按钮的作用是：监听用户的点击事件，在用户点击后做出响应

详情请看:   [4.2 UIButton](UIKit/Button.md) 
1. UIButton在storyboard中的使用
2. UIButton在代码中的使用以及UIButton监听点击
3. 按钮的介绍以及按钮的状态
4. UIButton和UIImageView和UILabel的选择问题

### UILabel 文本标签
文本标签的作用是显示一串固定的文字

详情请看:  [4.1 UILabel](UIKit/Label.md)

1. UILabel在storyBoard中的使用
1. iOS中播放音效
1. 设置毛玻璃效果
1. UIlabel在代码中的使用
1. 资源存放问题


### UIImageView 图片显示

1. UIImageView的序列帧动画
1. UIImageView在代码中的使用
1. UIImageView的frame设置
1. imagenamed和imageWithContentOfFile的区别

### UITextField 文本输入框
文本输入框可以弹出键盘，让用户输入文本内容

### UIScrollView  滚动的控件
如果内容比较多，超出了一个屏幕，就可以用它来显示

### UITableView  表格
如果每一行显示的内容格式差不多，就用这个表格控件

### UICollectionView 九宫格
如果显示的东西是一块一块、一格一格的，而且每个格子长的差不多，就可以用它

### UIWebView 网页显示控件
一般用来显示网页，使用它，就可以在手机上浏览网页

### UIAlertView  对话框（中间弹框）
从中间弹出一个框提示用户下一步该做什么

### UINavigationBar导航条
显示在顶部的条

## 3. 普通控件

### UIPageControl  分页控件
能显示当前的页码

* UITextView  能滚动的文字显示控件
如果文字内容比较多，需要换行显示，并且需要编辑

### UIActivityIndicator 圈圈
一直在转圈圈，表示让用户等待

### UISwitch 开关
要么打开，要么关上

###  UIActionSheet 底部弹框
从底部弹出一个框提示用户下一步该做什么

### UIDatePicker 日期选择器

## 4. 不太常用控件
###  UIToolbar  工具条
一般显示在底部或者键盘顶部，里面有几个小按钮

### UIProgressView 进度条
水平进度条，比如显示文件的下载进度，程序的启动进度

* UISlider 滑块
### UISegmentControl 选项卡
在固定的几个选项之间进行选择

### UIPickerView 选择器
在多行数据之间只选择一行

## 动画相关控件
- Quartz2D
- 核心动画
- 事件处理
- 手势
- UIDynamic


## 屏幕适配
- Autoresizing
- Autolayout
- Sizeclass
- Masonry

## 多控制器管理
- UINavigationController
- UITabBarController
- 自定义控制器管理



## 数据存储
1. 懒加载数据
1. plist文件回顾和从plist文件中读数据
2. 数据模型
