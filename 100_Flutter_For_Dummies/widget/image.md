# 图片组件
图片<https://www.jianshu.com/p/8dd6d074598c>


## 读取base64 数据格式的图片

```dart
var imgSource = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEYAAAAjCAIAAACmdes6AAACP0lEQVR4Xu2W0U3EQAxETxSA+OMnFdAL30AV1EUproB2SGJwhpldZ7MJEBDSfCT22Ot3vj3dxV5f/pguGvrt+kf6Mg2P9xrs01mQbKY6BOxESK79YKdDcu0BOwype4JEfT1PjWRd6zo7kmsTWCvSzfXzKAo+PdyFxiPxVW2X26ui0KlZ9DSC7UJyIZJmyaaDqnLPKlgTkvPUkGweN7akWTd4Kpk1lHgCJqFaR3KSHMnmM3Ikf0jGDSUeJKmt63gkpcJgMm4o8SiDgq0gBcYmJKSi12TcRo9SeTDiGVIweEGO5DZC0qWNg+rnSgokdPqzCgv9tYpEaxmfa41CHsddEY9VxtU+dBZFsFBTGRK9YqTW3T4jUU+TLxV1QE/xiCjRqqVcQyY8HtGgS89uQUJ5bTGoo+txfISGiqMnSCE8bKj8psfEtfLw1Ob+biSDFRXPTpCiyTBvTGvJU0yZIsXcVNaIhJvBS4V4OZLBr2Jt7iQ1leOLz03C7hHURvaBhBG9VKvjuie31eLv5fiiPAme9kqQIk5fvGIrvUtkS2aYyjVUlC4H8RymeAZRrd6l8OjcRFg8bip3hyZIioSi26LZQ5BctfhSHj7NoRKkGDeaIN7w+b/ffiTsr6mpPEyaQ21CIiFeICVUhERtMYjZeFjuUm0glyLhZ+/SDrofxUM/AqMNq9zpDxhf/NgxCvq0tZxGqWW10LMa9PhPIpEIrw/J9Ec8sbZoZ3mI8FS1uJ0Wyda25AYNmiIl1hbtqSV1I70B+dAU/4dAw64AAAAASUVORK5C"

Image.memory(
  base64.decode(
    imgSource.split(',')[1]),
    height:30,    //设置高度
    width:70,    //设置宽度
    fit: BoxFit.fill,    //填充
    gaplessPlayback:true, //防止重绘
  )
```

### 参考资料
- https://microzz.com/2019/11/03/flutter-base64/
- https://www.jianshu.com/p/d980780f40ad
- https://microzz.com/2019/11/03/flutter-base64/