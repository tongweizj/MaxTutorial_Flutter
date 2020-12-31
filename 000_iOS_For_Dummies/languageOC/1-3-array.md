# 数组 和 字典

## 内容索引

* 基本概念
* 常用方法

## 1. 基本概念

* NSArray 静态数组、不可变数组
* NSMutableArray  可变数组

## 2. 不可变数组NSArray
 
- 静态数组 
- 不修改该数组中的元素，也不能添加元素

### 常用方法

1> 创建不可变数组

```objc
NSArray *array = [NSArray arrayWithObject@"iphone", @"sanung", @"miui",nil];
```

```objc

2> 获取元素个数

```objc
[array count];
NSlog(@"count = %ld",[array count]);
// count = 3;
```

3> 根据index值获取对象

```objc
NSLog(@"%@", [array objectAtIndex:2]);
//结果: miui

NSLog(@"%@", array[1]);
//结果: sanung;

```

4> 获得相应对象的下标

```objc
NSLog(@"%lu", [array indexOfObject:@"iphone"]);
// 结果: 0
```

5> 遍历数组

```objc
for (int i = 0; i < [array count] ; i++) {
    NSLog(@"%@", [array objectAtIndex:i]);
}
//结果为 iphone sanung miui
```

## 3. 可变数组NSMutableArray

### NSmutableArray 常用方法总结

1> 创建不可变数组对象

```objc
NSMutableArray *mArray = [NSMutableArray arrayWithObjects:@"Window", @"Unix", nil];
// nil不可少, 代表结束的标志
```

2> 在数组末尾添加元素

```objc

-(void)addObject:obj
[mArray addObject:@"Linux"];
```

3> 在特定位置插入元素

//方法：将对象 obj 插入到索引为 i 的位置

```objc
-(void)insertObject:obj atIndex:i
[mArray insertObject:@"Mac" atIndex:0]; 
```

4> 删除最后一个元素

```objc
[mArray removeLaseObject];
NSLog(@"%@", mArr);
```

5> 根据对象删除元素

```objc
-(void)removeObject:obj
[mArray removeObject:@"Window"];
NSLog(@"%@", mArray);
```

6> 从数组中删除索引为 i 的对像

```objc
-(void)removeObjectAtIndex:i
[mArray removeObject:0];
```

7> 替换:将数组中索引为 i 处的元素用obj 置换

```objc
-(void)replaceObjectAtIndex:i withObject:obj
[mArray replaceObjectAtIndex:0 withObject:@"BSD"];
```

8> 将2个指定位置的元素交换

```objc
[mArray exchangeObjectAtIndex:0 withObjectAtIndex:1];
```



//用 selector 只是的比较方法将数组排序
-(void)sortUsingSelector:(SEL)selector	
```
### 注意事项

#### 1> 数值与对象转换

因为数组和字典中存放的只能是对象类型. 
所以一般的数值是不能直接存入的, 只能转化成对象元素才能存入!

```objc
int c = 100;
float f = 1.2;
NSNumber *c1 = [NSNumber numberWithDouble:c];
NSNumber *f1 = [NSNumber numbserWithDouble:f];
//这是把数值转化为了NSNumber格式存入到了字典, 当然你也可以数值转化为字符串格式存入!

NSMubleArray *mArr2 = [NSMutableArray arrayWithObjects:c1, f1, nil];
```

## 数组 + 字典 组合使用场景

```objc
// 方式四 (数组 + 字典)
NSArray<NSDictionary *> *dataArr = @[
                                        @{@"name":@"单肩包", @"icon":@"danjianbao"},
                                        @{@"name":@"钱包", @"icon":@"qianbao"},
                                        @{@"name":@"链条包", @"icon":@"liantiaobao"},
                                        @{@"name":@"手提包", @"icon":@"shoutibao"},
                                        @{@"name":@"双肩包", @"icon":@"shuangjianbao"},
                                        @{@"name":@"斜挎包", @"icon":@"xiekuabao"}
                                        ];
// 设置数据
NSDictionary *dict = dataArr[index];
iconView.image = [UIImage imageNamed:dict[@"icon"]];
titleLabel.text = dict[@"name"];
```