# 懒加载

## 1.什么是懒加载？
- 英文名LazyLoad,也称为延迟加载
- 在需要的时候才加载(效率低，占用内存小)。
- 所谓懒加载，写的是其get方法。

## 优点
- 不必将创建对象的代码全部写在viewDidLoad方法中，代码的可读性更强。
- 每个控件的getter方法中分别负责各自的实例化处理，代码彼此之间的独立性强，松耦合。

 
## 示例代码

### 不是lazyLoad

```objc
@interface ViewController ()

@property (nonatomic, strong) NSArray *shopData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _shopData = [NSArray arrayWithContentsOfFile:
[[NSBundle mainBundle] pathForResource:@"shop" ofType:@"plist"]];
}

@end
```

- 显而易见，当控制器被加载完成后就会加载当前的shopData，假如shopData是在某些事件被触发的时候才会被调用，没必要在控制器加载完就去获取plist文件，如果事件不被触发，代表着shopData永远不会被用到，这样在viewDidLoad中加载shopData就会十分多余，并且耗用内存


### 懒加载代码示例

```objc
- (void)viewDidLoad { 
    [super viewDidLoad];
}

- (NSArray *)shopData
{
    if (!_shopData) {
        _shopData = [NSArray arrayWithContentsOfFile:
[[NSBundle mainBundle] pathForResource:@"shop" ofType:@"plist"]];
    }
    return _shopData;
}

@end
```
- 当需要用到shopData的时候，就会调用[self shopData]的方法（即getter方法），此时系统会去调用getter方法，然后再getter方法中获取plist文件内容，然后返回使用（需要注意在getter方法里切勿使用self.shopData，因为self.shopData会调用getter方法，造成死循环）

#### 总结：懒加载即用到时方去加载对象
