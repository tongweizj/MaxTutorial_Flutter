#常见错误

## 错误1
 - 错误描述：
   
    ```objc
    [<ViewController 0x7fdc0152d300> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key label.
    ```
    - 原因：IBOutlet属性代码被删掉了，但是属性连线还在
    - 解决：将残留的连线删掉

## 错误2
 - 错误描述：
 ```objc
-[ViewController blueClick]: unrecognized selector sent to instance 0x7ff59d014320
 ```
- 原因：调用了一个不存在的方法
- 解决：认真检查方法名，使用正确并且存在的方法名






## 错误3
 - 错误描述：
```objc
Cannot invoke initializer for type 'String' with an argument list of type '(Int?)'
String 类型，不能用int？ ？代表是可选值，之间不能赋值

var s = String(tmp!)
加一个！

 ```
