# Xib

## Xib 基本概念

### Xib和storyboard对比
* 共同点：
    - 都用来描述软件界面
    - 都用Interface Builder工具来编辑
    - 本质都是转换成代码去创建控件
* 不同点
    * Xib是轻量级的，用来描述局部的UI界面
    * Storyboard是重量级的，用来描述整个软件的多个界面，并且能展示多个界面之间的跳转关系


## Xib的加载
方法1
```objc
NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"xib文件名" owner:nil options:nil]
```

方法2
```objc
UINib *nib = [UINib nibWithNibName:@"xib文件名" bundle:nil];
NSArray *views = [nib instantiateWithOwner:nil options:nil];
```


## 使用Xib自定义view的步骤

1. 新建自定义控件类
TWXibnameView.h
TWXibnameView.m

TWXibnameView: UIView

2. 新建xib文件
TWXibnameView.xib
