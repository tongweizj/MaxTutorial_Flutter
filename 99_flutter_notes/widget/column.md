# Column

## 资源
<https://www.jianshu.com/p/7512a42b773e>
<https://www.jianshu.com/p/0ce74751d970>
<https://www.jianshu.com/p/1d003ab6c278>
<https://www.jianshu.com/p/c0cb06c060a9>


## 常见用法

### 数据来源是List，生成column

利用 list.map().toList()

```flutter
itemList = [1,2,3,4];
Column(
    children: itemList.map((event) {
        return Column(); // return 是要遍历生成，column的子组件
    }).toList(),
    );
```