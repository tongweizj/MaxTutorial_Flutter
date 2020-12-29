---
title: Flutter Release 工作手册
date: 2020-06-03 15:24:45
tags:
- test
categories: 
- flutter
---
# Flutter Release 工作手册

## 资源

- [猫哥的编译发布](https://ducafecat.tech/2020/05/05/flutter-project/flutter-project-news-10-release/)



## 编译打包

注意事项
1. 为了尽量减少安装包尺寸，要做两件事情
2. 检查所有的图片资源，是否已经压缩过
3. 打包命令

```dash
flutter build apk --split-per-abi
```

