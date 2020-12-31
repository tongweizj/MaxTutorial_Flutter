# APP的图片资源存储方案选择


## 1. 图片存储的两种选择

### 1. 图片存储在Assets.xcassets里

1. \> 打包后变成Assets.car
2. \> 缺点: 拿不到路径
3. \> 只能通过imageNamed:来加载图片
4. \> 不能通过imageWithContentsOfFile:来加载图片

### 2. 文件夹方式存储在项目中
1. \> 可以拿到路径
2. \> 能通过imageNamed:来加载图片
3. \> 也能通过imageWithContentsOfFile:来加载图片

       
## 加载图片的方式
1. imageNamed:
    1. 就算指向它的指针被销毁,该资源也不会被从内存中干掉
    1. 放到Assets.xcassets的图片,默认就有缓存
    1. 图片经常被使用
2. imageWithContentsOfFile:
    1. 指向它的指针被销毁,该资源会被从内存中干掉
    1. 放到项目中的图片就不由缓存
    1. 不经常用,大批量的图片



```objc
// 方式一: 图片存储在Assets.xcassets里
//        直接用1,这个不包含文件后缀的文件名,在Assets.xcassets里搜索,并返回图片对象
self.imageView.image = [UIImage imageNamed:@"1"];



// 方式二 文件夹方式存储在项目中
// 1. 先通过文件名+文件类型,在导入项目的资源中搜索,返回的是路径
NSString *path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"];

// 2.用路径来获取图片对象
self.imageView.image = [UIImage imageWithContentsOfFile:path];



```