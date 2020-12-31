# Stack 层叠布局

## 资源

<https://book.flutterchina.club/chapter4/stack.html>

## Stack & Positioned

Flutter中使用Stack和Positioned这两个组件来配合实现绝对定位。Stack允许子组件堆叠，而Positioned用于根据Stack的四个角来确定子组件的位置。

### Stack 说明

```dart
Stack({
  this.alignment = AlignmentDirectional.topStart,
  this.textDirection,
  this.fit = StackFit.loose,
  this.overflow = Overflow.clip,
  List<Widget> children = const <Widget>[],
})
```

* alignment
  此参数决定如何去对齐没有定位（没有使用Positioned）或部分定位的子组件。
  所谓部分定位，在这里特指没有在某一个轴上定位：left、right为横轴，top、bottom为纵轴，只要包含某个轴上的一个定位属性就算在该轴上有定位。

* textDirection
  和Row、Wrap的textDirection功能一样，都用于确定alignment对齐的参考系，
  即：textDirection的值为TextDirection.ltr，则alignment的start代表左，end代表右，即从左往右的顺序；textDirection的值为TextDirection.rtl，则alignment的start代表右，end代表左，即从右往左的顺序。
* fit
  此参数用于确定没有定位的子组件如何去适应Stack的大小。
  * StackFit.loose 表示使用子组件的大小
  * StackFit.expand 表示扩伸到Stack的大小。
* overflow：此属性决定如何显示超出Stack显示空间的子组件；值为Overflow.clip时，超出部分会被剪裁（隐藏），值为Overflow.visible 时则不会。

### Positioned 说明

```dart
const Positioned({
  Key key,
  this.left,
  this.top,
  this.right,
  this.bottom,
  this.width,
  this.height,
  @required Widget child,
})
```

* left、top 、right、 bottom分别代表离Stack左、上、右、底四边的距离。
* width 和 height用于指定需要定位元素的宽度和高度。
* 注意，Positioned的width、height 和其它地方的意义稍微有点区别，此处用于配合left、top 、right、 bottom来定位组件，举个例子，在水平方向时，你只能指定left、right、width三个属性中的两个，如指定left和width后，right会自动算出(left+width)，如果同时指定三个属性则会报错，垂直方向同理。
  
### 示例

在下面的例子中，我们通过对几个Text组件的定位来演示Stack和Positioned的特性：

```dart
//通过ConstrainedBox来确保Stack占满屏幕
ConstrainedBox(
  constraints: BoxConstraints.expand(),
  child: Stack(
    alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
    children: <Widget>[
      Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
        color: Colors.red,
      ),
      Positioned(
        left: 18.0,
        child: Text("I am Jack"),
      ),
      Positioned(
        top: 18.0,
        child: Text("Your friend"),
      )
    ],
  ),
);
```