/*优化二：嵌套过多=====>进行布局重构，自定义widget类*/
import 'package:flutter/material.dart';

main(){
  //1、runAPP()函数：运行一个应用程序（是一个全局函数）
  //runApp要求传入一个widget,万物皆是widget
  //但widget是一个abstract是一个抽象类，抽象类不能够被实例化，所以可以创建它的子类
  runApp(MyApp());
}

/*
* 有状态的widget：statefulwidget   在运行过程中有一些状态的改变
* 无状态的widget：statelesswidget   运行过程中没有状态的改变
* MyApp类继承自StatelessWidget，是StatelessWidget的子类*/
//创建一个自己的类
class MyApp extends StatelessWidget{
  /*widget是抽象类，必须要实现其中的抽象方法===>Element
  * 但是由于Element的实现比较困难，且没有说明是有状态还是无状态的widget*/
  /*StatelessWidget 也有一个抽象方法必须实现====>build方法*/
  @override
  /*在build方法中告诉flutter，我们的widget希望渲染什么元素
  * build的参数是上下文*/

  Widget build(BuildContext context)
  {
    return  MaterialApp(
      //scaffol快速搭建页面===>脚手架
        home:Scaffold(
          //导航栏 可以不设置
          //AppBar是Statefulwidget的子类
          /*final PreferredSizeWidget? appBar;=====>appBar是PreferredSizeWidget类型，但是由于PreferredSizeWidget是抽象类，所以可以使用它的子类AppBar*/
            appBar: AppBar(
                title: Center
                (
                  child:Text
                  (
                    "第一个flutter程序",
                    style: TextStyle
                    (
                        fontSize: 20,
                        color: Colors.green
                    ),
                  )
                )
            ),
            //body中间部分的内容
            body:HYpage()/*将body的center嵌套成一个widget*/
        )
    );
  }
}

class HYpage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Center(
      /*在Text小部件外部包含一个center部件，让Text作为其child*/
        child: Text
        (
            "小杨要开始学Flutter了",//必选参数
            style: TextStyle(
                fontSize: 30,//字体
                color: Colors.amber),//Colors是个类,类中包含许多静态属性
            textAlign: TextAlign.center
        )
    );
  }
}