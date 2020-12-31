# UITableView

#### 基本使用方法

- 设置UITableView的dataSource、delegate
- UITableView多组数据和单组数据的展示

#### Cell
* UITableViewCell的常见属性
* 自定义Cell
    1 等高的cell的写法
        * 纯代码
        * frame
        * Autolayout
        * xib
        * storyboard
    2 自定义-不等高的cell的写法
        * 纯代码
        * frame
        * Autolayout
        * xib
        * storyboard
* 代码优化
    * 性能优化（cell的循环利用）
    * 数据端优化 Dict->Model



## 1. UITableView 的基本概念

### 1.1 UITableView 整体概念

* UITableView 呈现列表数据
* UITableView继承自UIScrollView，因此支持垂直滚动，而且性能极佳


### 1.2 代码基本构造

``` objc
// 实现数据源协议里面的方法

// 1）设置数据信息
self.tableView.dataSource = self;

// 2）申明协议 UITableViewDataSource
@interface ViewController ()<UITableViewDataSource>
@end

/**
 * 3）告诉tableView⼀一共有多少组
 */
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{}

/**
 * 4）告诉tableView第section组有多少⾏行
 */
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
 (NSInteger)section
 { }

/**
 *  5）告诉tableView每⼀一⾏行显⽰示的内容(tableView每⼀一⾏行都是UITableViewCell)
 */
 - (UITableViewCell *)tableView:(UITableView *)tableView
 cellForRowAtIndexPath: (NSIndexPath *)indexPath
{ } 

```

### 1.3 整体可配置的参数

#### 样式 UITableViewStyle

* 不分组 UITableViewStylePlain  Plain朴素
* 分组  UITableViewStyleGrouped  Grouped 被分组

### 组相关配置参数

```objc
/**
 * 告诉tableView每⼀一组头部显⽰示的标题
 */
 - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
 (NSInteger)section
{ }

/**
 * 告诉tableView每⼀一组尾部显⽰示的标题
 */
 - (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:
 (NSInteger)section
{ }  


// 设置表头
self.tableView.tableHeaderView = [[UISwitch alloc] init] ;

// 设置表尾
self.tableView.tableFooterView = [UIButton
buttonWithType:UIButtonTypeContactAdd];

// 设置索引条上⽂文字颜⾊色
self.tableView.sectionIndexColor = [UIColor redColor];

// 设置索引条的背景颜⾊色
self.tableView.sectionIndexBackgroundColor = [UIColor blackColor];
```

### CELL相关配置参数

``` objc
// 设置tableView每⼀一⾏行cell的⾼高度,默认是44 
self.tableView.rowHeight = 80;

// 设置tableView每⼀一组头部的⾼高度
self.tableView.sectionHeaderHeight = 50;

// 设置tableView每⼀一组尾部的⾼高度
self.tableView.sectionFooterHeight = 50;

// 设置分割线的颜⾊色,如果设置[UIColor clearColor]隐藏分割线
self.tableView.separatorColor = [UIColor redColor];

// 设置分割线的样式
self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;



// 设置cell右边的指⽰示控件
cell.accessoryView = [[UISwitch alloc] init];

// 设置cell右边的指⽰示样式(accessoryView优先级 > accessoryType)
cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

// 设置cell的背景view
// backgroundView优先级 > backgroundColor
UIView *bg = [[UIView alloc] init];
bg.backgroundColor = [UIColor blueColor];
cell.backgroundView = bg;

// 设置cell的背景颜⾊色
cell.backgroundColor = [UIColor redColor];

// 设置cell选中的背景view
UIView *selectbg = [[UIView alloc] init];
selectbg.backgroundColor = [UIColor purpleColor];
cell.selectedBackgroundView = selectbg;

// 设置cell选中的样式
cell.selectionStyle = UITableViewCellSelectionStyleNone;
```


### 4.代理方法
``` objc

/**
 * 当选中某⼀一⾏行cell就会调⽤用
 */
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
 (NSIndexPath *)indexPath
 { }

/**
 * 当取消选中某⼀一⾏行cell就会调⽤用
 */
 - (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:
 (NSIndexPath *)indexPath
 { }

/**
 * 返回每⼀一组显⽰示的头部控件
**/
 - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:
 (NSInteger)section
 { }

/**
* 返回每⼀一组显⽰示的尾部控件
**/
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:
 (NSInteger)section
 { }

/**
 * 返回每⼀一组头部的⾼高度
 *
 */
 - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:
 (NSInteger)section
 { }

/**
 * 返回每⼀一组尾部的⾼高度
 *
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:
(NSInteger)section
{ }

/**
 * 返回tableView每⼀一⾏行的⾼高度
 */
 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:
 (NSIndexPath *)indexPath
```

### 5.性能优化

#### 5.1 传统的写法

``` objc
/**
 * 每当有⼀一个cell进⼊入视野范围内就会调⽤用1次
 */
 - (UITableViewCell *)tableView:(UITableView *)tableView
 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 0.定义⼀一个重⽤用标识
    static NSString *ID = @"wine";
    
    // 1.⾸首先去缓存池中查找可循环利⽤用的cell
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果缓存池中没有,⾃自⼰己创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
        initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

    //3. 设置数据
    cell.textLabel.text = [NSString stringWithFormat:@"%zd⾏行数据",indexPath.row];
    return cell;
 }
```

 #### 5.2 注册写法
``` objc
 - (void)viewDidLoad {
    [super viewDidLoad];
    // 根据ID 这个标识 注册对应的 cell类型
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

/**
* 每当有⼀一个cell进⼊入视野范围内就会调⽤用1次
*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1.⾸首先去缓存池中查找可循环利⽤用的cell
     UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.设置数据
    cell.textLabel.text = [NSString stringWithFormat:@"%zd⾏行数据",indexPath.row];
    return cell;
}
 ```


## 6.索引条

``` objc
/**
* 返回每⼀一组的索引标题(数组中都是NSString对象)
*/
 - (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView
 *)tableView
 {}
 ```


  [wine setValuesForKeysWithDictionary:dict]; //便捷方法，将一根字典数据隐射到一根模型里面