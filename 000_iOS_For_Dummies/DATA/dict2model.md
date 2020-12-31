# 字典转模型


## Model部分

### XMGShop.h
```objc
#import <Foundation/Foundation.h>

@interface XMGShop : NSObject

/** 图片的名称 */
@property (nonatomic, copy) NSString *icon;
/** 商品的名称 */
@property (nonatomic, copy) NSString *name;

// 提供构造方法
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)shopWithDict:(NSDictionary *)dict;

@end
```

### XMGShop.m
```objc
#import "XMGShop.h"

@implementation XMGShop
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}

+ (instancetype)shopWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
```


## view 部分


```objc
#import "XMGViewController.h"
#import "XMGShop.h"  //<=========  导入model

@interface XMGViewController ()

// 购物车
@property (weak, nonatomic) IBOutlet UIView *shopCarView;
// 添加按钮
@property (weak, nonatomic) IBOutlet UIButton *addButton;
// 删除按钮
@property (weak, nonatomic) IBOutlet UIButton *removeButton;

/** 数据数组 */
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation XMGViewController
/**
 *  懒加载
 */
- (NSArray *)dataArr{
    if (_dataArr == nil) {
        // 加载数据
        // 1.获取全路径
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"shopData.plist" ofType:nil];
        self.dataArr = [NSArray arrayWithContentsOfFile:dataPath];
        // 字典转模型
        // 创建临时数组
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in _dataArr) {
            // 创建shop对象
            XMGShop *shop = [XMGShop shopWithDict:dict];
            // 把模型装入数组
            [tempArray addObject:shop];
        }
        self.dataArr = tempArray;
    }
    return _dataArr;
}


/**
 *  从模型中取数据
 */
- (IBAction)add:(UIButton *)button {

/***********************3.设置数据*****************************/
    // 设置数据
    XMGShop *shop = self.dataArr[index];
    iconView.image = [UIImage imageNamed:shop.icon];
    titleLabel.text = shop.name;    
}

@end
```