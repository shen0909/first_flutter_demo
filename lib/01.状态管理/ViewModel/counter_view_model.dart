import 'package:flutter/material.dart';
/*ChangeNotifier=====>真正数据存放的地方
*
* 这里我们可以使用继承自ChangeNotifier，也可以使用混入，这取决于概率是否需要继承自其它的类
我们使用一个私有的_counter，并且提供了getter和setter
在setter中我们监听到_counter的改变，就调用notifyListeners方法，通知所有的Consumer进行更新
* */
class HYCounterViewModel extends ChangeNotifier{
int _counter=99;

  int get counter => _counter;//一般就是本来的_counter

  set
  counter(int value) {
    _counter = value;
    notifyListeners();//通知所有的监听者Consumer进行数据更新
  } //私有变量
  //重写 get set

}