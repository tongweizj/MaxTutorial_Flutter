# 循环结构


## 大纲
- for
- while
- do


---

## for

for( init_expression; loop_condition; loop_expression)  #分割符是 ；号，不是‘,’号
  {
    program statement;
  }


for( i=0, j=0; i<10; i++, j--)   #expression 中可以写多个算式
    {
      program statement;
    }


NSLOG ("%2i %i", n, triangularNumber);  # %2i 表示占2个字符宽度



## while

while( expression )  #expression 为真，就继续执行
{
  program statement;
}

### 和for的差异
- 可预计循环次数的时候，用for
- 不可预计时，用while


## do while

do{
  program statement;
}while( expression );  #expression 为真，就继续执行


## 其他

 break;   #跳出循环，后续代码不被执行


 continue;   #跳过后续代码，不被执行，但循环继续
