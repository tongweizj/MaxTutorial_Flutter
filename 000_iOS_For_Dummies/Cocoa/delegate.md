#delegate

## delegate 的作用

delegate 是一个事件监听器.
如果实现代理必须实现代理中所规定的方法，此时若用户按下了home键，即delegate接收到了applicationWillEnterBackground的消息，于是调用协议中的(void)applicationWillEnterBackground:方法作出响应。而协议里面的方法就相当于上面的actionPerformed(ActionEvent event)方法。

那么为什么这个delegate的作用何在呢，为什么需要有delegate出现呢？

MVC是一种设计模式，当用户操作view时，为了及时作出响应更新界面，controller必须监听到用户的动作，在model处理完毕后由controller向view发送消息更新界面。

MVC模式中view和controller是分离开来各司其职的，那么二者之间如何通信或者如何联系呢，这个时候delegate就用到了，将controller设置为view的delegate，view负责向用户展示图形界面，而view上的数据更新等操作则委托给controller代为完成，因此可以说delegate既实现了view和controller的分离，但又将二者紧密地联系在一起。

delegate是iOS中实现MVC模式必不可少的一部分。

## 实例:监听scrollView各种行为的3大步骤(比如让控制 器监听scrollView的行为)

*  1/设置scrollView的delegate(代理)为控制器对象
```objc
 scrollView.delegate = 控制器;
```

* 2/ 控制器要遵守UIScrollViewDelegate协议
```objc
 @interface 控制器 () <UIScrollViewDelegate> 
 @end
 ```
* 3/ 控制器要实现UIScrollViewDelegate协议里面的代理方法

```objc
 #pragma mark - <UIScrollViewDelegate> 代理 法
 /**
* 只要scrollView在滚动，就会调 这个 法(监听scrollView的滚动)
  */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll-滚动"); 
}
 ```
     scrollView.delegate = 控制器;
  

## 代理使用的一般规律

* 作用:用来监听控件的某些行为
* 代理:是控制器对象
* 代理:是id类型，并且是弱指针(weak) 代理协议的格式:控件类名+Delegate，比如UIScrollViewDelegate、 UITableViewDelegate 
* 代理方法:方法名一般是控件名开头，比如UIScrollView的代理方法一般以scrollView开 头


## 如何监听控件的行为

* 通过addTarget:
    * 只有继承自UIControl的控件，才有这个功能 
    * UIControlEventTouchUpInside : 点击事件(UIButton)
    * UIControlEventValueChanged : 值改变事件(UISwitch、UISegmentControl、 UISlider)
    * UIControlEventEditingChanged : 文字改变事件(UITextField)
* 通过delegate 
   * 只有拥有delegate属性的控件，才有这个功能
