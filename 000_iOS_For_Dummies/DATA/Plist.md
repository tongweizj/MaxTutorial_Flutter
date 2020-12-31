# Plist

## Plist文件

直接将数据直接写在代码里面，不是一种合理的做法。如果数据经常改，就要经常翻开对应的代码进行修改，造成代码扩展性低

因此，可以考虑将经常变的数据放在文件中进行存储，程序启动后从文件中读取最新的数据。如果要变动数据，直接修改数据文件即可，不用修改代码

一般可以使用属性列表文件存储NSArray或者NSDictionary之类的数据，这种“属性列表文件”的扩展名是plist，因此也称为“plist文件”

## 解析Plist文件

### 方法1: 懒加载, 用一个NSArray来提取plist文件中的数据

```objc
// 1. 获得Plist文件的全路径
NSBundle *bundle = [NSBundle mainBundle];
NSString *path = [bundle pathForResource:@"shops" ofType:@"plist"];

// 2. 加载plist文件
_shops = [NSArray arrayWithContentsOfFile:path];
```



### 方法2: 用模型懒加载

#### 用模型取代字典的好处

#####  使用字典的坏处
1. 编写key时,没有智能提示

一般情况下，设置数据和取出数据都使用“字符串类型的key”，编写这些key时，编辑器没有智能提示，需要手敲
```objc
dict[@"name"] = @"Jack";
NSString *name = dict[@"name"];
```

2. 写错key,没有提醒

Key如果写错了，编译器不会有任何警告和报错，造成设错数据或者取错数据

#####  使用模型的好处

* 所谓模型，其实就是数据模型，专门用来存放数据的对象，用它来表示数据会更加专业
* 模型设置数据和取出数据都是通过它的属性，属性名如果写错了，编译器会马上报错，因此，保证了数据的正确性
* 使用模型访问属性时，编译器会提供一系列的提示，提高编码效率

```objc
app.name = @"Jack";
NSString *name = app.name;
```

#### 字典转模型

字典转模型的过程最好封装在模型内部
模型应该提供一个可以传入字典参数的构造方法
```objc
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)xxxWithDict:(NSDictionary *)dict;

```


instancetype
- instancetype在类型表示上，跟id一样，可以表示任何对象类型
- instancetype只能用在返回值类型上，不能像id一样用在参数类型上
- instancetype比id多一个好处：编译器会检测instancetype的真实类型

## 代码创建Plist文件

### 1.写入数组
```objc
//
//  main.m
//  03-plist文件的回顾
//
//  Created by xiaomage on 15/12/29.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       //  1.写入数组
        NSArray *names = @[@"yjh", @"gxq", @"mj", @"nj"];
        BOOL flag = [names writeToFile:@"/Users/xiaomage/Desktop/names.plist" atomically:YES];
```

### 2.写入字典
```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *persons = @{
                                  @"name" : @"yjh",
                                  @"age" : @18,
                                  @"height" : @1.88
                                  };
        BOOL flag = [persons writeToFile:@"/Users/xiaomage/Desktop/person.plist" atomically:YES];
        if (flag) {
            NSLog(@"写入成功!");
    }    
```

### 3.写入数组+字典
```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {         
    NSArray *persons = @[
                            @{@"name" : @"mj", @"age":@38},
                            @{@"name" : @"yjh", @"age":@25, @"friends":@[@"大神11期", @"sz"]}
                            ];
    BOOL flag = [persons writeToFile:@"/Users/xiaomage/Desktop/persons.plist" atomically:YES];
    if (flag) {
        NSLog(@"写入成功!");
    }
         */
        NSArray *dataArr = @[
                         @{@"name":@"单肩包", @"icon":@"danjianbao"},
                         @{@"name":@"钱包", @"icon":@"qianbao"},
                         @{@"name":@"链条包", @"icon":@"liantiaobao"},
                         @{@"name":@"手提包", @"icon":@"shoutibao"},
                         @{@"name":@"双肩包", @"icon":@"shuangjianbao"},
                         @{@"name":@"斜挎包", @"icon":@"xiekuabao"}
                         ];
        BOOL flag = [dataArr writeToFile:@"/Users/xiaomage/Desktop/shopData.plist" atomically:YES];
        if (flag) {
            NSLog(@"写入成功!");
        }
       
//读取plist文件
NSArray *persons = [NSArray arrayWithContentsOfFile:@"/Users/xiaomage/Desktop/persons.plist"];
//        NSLog(@"%@", persons);
    }
    return 0;
}

```