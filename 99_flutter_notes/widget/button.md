# 按钮 button

## button类型

|  按钮   | 说明  |
|  ----  | ----  |
|   MaterialButton |  - MD 风格的按钮，可以设置宽高值，是 Flutter 中所有按钮的基类
|   RaisedButton |  - 凸起按钮，带阴影
|   FlatButton |  - 扁平按钮，不带阴影，FlatButton, a material design button without a shadow.
|   OutlineButton |  - 自带边框的按钮，不能设置背景色color
|   IconButton |  - 在 Icon 基础上加上点击事件，不能设置背景色和边框，IconButton, to create buttons that just contain icons.
|   FloatingActionButton |  - 悬浮按钮，FloatingActionButton, the round button in material applications.
|   ButtonBar |  按钮组
|   RawMaterialButton |  横向按钮组
|   DropdownButton |  , a button that shows options to select from.
|   InkWell |   , which implements the ink splash part of a flat button.
|   RawMaterialButton |  , the widget this widget is based on.


## 资源
|  来源   | 地址  |
|  ----  | ----  |
| API官方 | https://api.flutter.dev/flutter/material/RaisedButton-class.html |
| material官方 | https://material.io/components/buttons-floating-action-button |

https://juejin.im/post/5d75c7e7e51d4561a91850e8

## MaterialButton

|  来源   | 地址  |
|  ----  | ----  |
| 官方 | https://api.flutter.dev/flutter/material/RaisedButton-class.html |


MaterialButton 是 Flutter 中所有 Button 类型的基类，MaterialButton 的参数再其他 Button 中都是通用的

```dart
  const MaterialButton({
    Key key, 
    @required this.onPressed, // 点击事件，必须给值，写null的话表示不可用
    this.onHighlightChanged, 
    
    this.textTheme, //默认文字样式
    this.textColor, // 文字颜色
    this.color, // 背景色

    this.disabledTextColor, // 不可用时文字颜色
    this.disabledColor, // 按钮被禁用时的文字颜色
    this.highlightColor, // 按钮的水波纹亮起的颜色，点击之后的颜色，注意这个颜色点击之后就一直在这里了，不是那种一瞬间显示
    this.splashColor, // 波浪纹颜色
    this.colorBrightness, // 按钮主题高亮
    
    this.elevation, // Z轴、阴影，正常应该小于 5
    this.highlightElevation, // 按钮高亮时的下面的阴影长度
    this.disabledElevation,
    
    this.padding,
    this.shape, // 按钮样式
    this.clipBehavior = Clip.none,
    this.materialTapTargetSize,
    this.animationDuration,
    this.minWidth,
    this.height,
    this.child, // 按钮内部widget，一般都是text
  })

```

## RaisedButton

### 资源

|  来源   | 地址  |
|  ----  | ----  |
| 官方 | https://api.flutter.dev/flutter/material/RaisedButton-class.html |
