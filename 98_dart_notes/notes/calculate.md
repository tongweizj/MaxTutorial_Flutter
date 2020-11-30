# Dart 运算相关知识

## 1、Dart运算符

### 算术运算符

    +    -    *    / 
    ~/ (取整)     %（取余）
  
### 关系运算符

    ==    ！=   >    <    >=    <=

### 逻辑运算符

    !  &&   ||

### 取反!

```dart

bool flag=false;
print(!flag);   //取反

```

### && 并且

全部为true的话值为true 否则值为false

```dart
  bool a=true;
  bool b=true;

  print(a && b);

```

### || 或者

全为false的话值为false 否则值为true

```dart
  bool a=false;
  bool b=false;

  print(a || b);

```

//如果一个人的年龄是20 并且 sex是女的话我们打印这个人
```dart
  int age=20;
  String sex="女";
  if(age==20 && sex=="女"){

    print("$age --- $sex");

  }else{

    print("不打印");

  }
```


//如果一个人的年龄是20 或者 sex是女的话我们打印这个人
```dart
  int age=23;
  String sex="女";
  if(age==20 || sex=="女"){

    print("$age --- $sex");

  }else{

    print("不打印");

  }



}
```

### 赋值运算符

    基础赋值运算符   =   
    判断赋值 ??=  如果.. 
    复合赋值运算符   +=  -=  *=   /=   %=  ~/=

#### 1、基础赋值运算符   =   ??=

```dart
int a=10;
int b=3;
print(a);

int c=a+b;   //从右向左


b??=23;  // 表示如果b为空的话把 23赋值给b

int b=6;
b??=23;
print(b);


int b;
b??=23;
print(b);
```

#### 2、复合赋值运算符   +=  -=  *=   /=   %=  ~/=

``` dart
var a=12;
a=a+10;
print(a);

var a=13;
a+=10;   //表示a=a+10
print(a);

var a=4;
a*=3;  //a=a*3;
print(a);

}
```

### 条件表达式 

    if  else   switch case 

    三目运算符

    ??运算符：


## 2、类型转换

1、Number与String类型之间的转换


2、其他类型转换成Booleans类型

