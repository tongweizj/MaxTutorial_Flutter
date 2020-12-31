# 11 分类和协议

##本小节知识点

分类
以模块的形式向类添加方法




## 11.3 协议和代理

协议是多个类共享的一个方法列表。


```

@protocol NSCopying
- (id) copyWithZone: (NSZone *)zone;
@end
```
