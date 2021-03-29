# flutter 开发版本的管理手册

https://juejin.cn/post/6865468743435157512

https://www.jianshu.com/p/b3b0023f7468

## Flutter Channel切换

Flutter 官方发布一共有四个渠道，分别是 stable, beta, dev, 和 master。

 1、`Stable：`稳定版。近一年中最好的beta版本。
 2、`Beta：`测试版。每隔几周都会选取近几个月中最好的dev版本作为Beta版。
 3、`dev：`最新的经过完全测试的版本。包含新功能，但可能有一些问题。
 4、`master：`最新版，但未经测试。



官方推荐我们使用 stable 渠道，因为他更稳定，各方面兼容性更好。



### 查看当前使用channel

```
flutter channel
---
Flutter channels:
  master
  dev
  beta
* stable (当前渠道)
```



### 切换到某一个channel

```
flutter channel dev
```



## flutter sdk



### flutter sdk 的版本

 1、`Stable：`稳定版。近一年中最好的beta版本。
 2、`Beta：`测试版。每隔几周都会选取近几个月中最好的dev版本作为Beta版。
 3、`dev：`最新的经过完全测试的版本。包含新功能，但可能有一些问题。
 4、`master：`最新版，但未经测试。



##### 



- 查看`flutter sdk`版本号`flutter --version`
- flutter 升级
   [通过这个地址找到要更新的版本号](https://links.jianshu.com/go?to=https%3A%2F%2Fflutter.dev%2Fdocs%2Fdevelopment%2Ftools%2Fsdk%2Freleases%3Ftab%3Dmacos)



```csharp
flutter upgrade   //指令代码      只升级依赖包   
flutter upgrade v1.9.1+hotfix.3 // 升级到指定的  v1.9.1+hotfix.3 版本      
flutter packages get        // 获取pubspec.yaml中所有的依赖关系          
flutter packages upgrade  //获取pubspec.yaml中所有列表中的依赖项的最新版
```

