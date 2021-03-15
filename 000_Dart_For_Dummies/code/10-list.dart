main() {
  /// List 知识点
  /// --------------------------
  // List l = [1, 2, 3];
  // print(l.last);
  // list = new List();
  // list.add(1);
  // list.add(2);
  // list.add(3);
  // list.add(4);
  // list.add(5);

  /**
   * 遍历list的三种方法
   */
  // List list = ['香蕉', '苹果', '梨'];

  //第一种 for循环
  // for (int i = 0; i < list.length; i++) {
  //   print(list[i]);
  // }
  // print("----分割线----");

  //第二种 foreach
  // for (var value in list) {
  //   print(value);
  // }
  // print("----分割线----");

  //第三种 函数foreach
  // list.forEach((value) {
  //   print(value);
  // });
  // print("----分割线----");

  /**
   * 处理list中的每个元素
   */
  // List list2 = new List();
  // for (int i = 0; i < list.length; i++) {
  //   list2.add(list[i] * 2);
  // }
  // print(list2);

  // print("----分割线----");

  //更简单的方法
  List list = ['香蕉', '', '苹果', '梨'];
  var newList = list.map((value) {
    print(value);
    return value + '1';
  });

  print(newList.toList());
  newList.toList().remove('1');
  print(newList.toList());

  print("----分割线----");

  /**
   * 只要list中大于2的数据 可以用where
   */
  // var newList2 = list.where((value) {
  //   return value > 2;
  // });
  // print(newList2.toList());

  // print("----分割线----");

  /**
   * 判断只要集合中有满足条件的 返回true
   */
  // var newList3 = list.any((value) {
  //   return value < 4;
  // });
  // print(newList3);
  // print("----分割线----");

  /**
   * every判断集合中所有的值都要满足条件 返回true 否则返回false
   */
  var newList4 = list.every((value) {
    return value < 3;
  });
  print(newList4);

  print("----分割线----");

  /**
   * 循环set的方法
   */

  var set = new Set();
  set.addAll(list);
  /**
   * dark是支持箭头函数的 这句代码
   * set.forEach((value){
   *   print(value);
   *  });
   */
  set.forEach((value) => print(value));

  print("----分割线----");

  /**
   * 循环Map
   */
  Map map = {'name': 'mrwang', 'sex': '男'};
  map.addAll({'like': '⛹', 'money': 'null'});
  map.forEach((key, value) => print("$key $value"));
}
