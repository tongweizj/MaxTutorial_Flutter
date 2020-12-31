#其他控件




## UISwitch对象
```
UISwitch *sw1 = [[UISwitch alloc] init]; //uiSwitch 没有其他属性可以设置
[redView addSubview:sw1];
```    
    
##  UISegmentedControl 选项卡对象
```
UISegmentedControl *sg = [[UISegmentedControl alloc] initWithItems:@[@"抬头1", @"抬头😄", @"抬头3"]]; 
//initWithItems 就是选项卡的抬头

[redView addSubview:sg];
```



## UIAlertController 弹窗提示