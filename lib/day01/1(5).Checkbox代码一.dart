import 'package:flutter/material.dart';

main()=>runApp(MyApp());
/*
* 有状态的widget：statefulwidget   在运行过程中有一些状态的改变
* 无状态的widget：statelesswidget   运行过程中没有状态的改变
* */
//创建一个自己的类,进行widget重构
class MyApp extends StatelessWidget{
  /*widget是抽象类，必须要实现其中的抽象方法===>Element
  * 但是由于Element的实现比较困难，且没有说明是有状态还是无状态的widget*/
  /*StatelessWidget 也有一个抽象方法必须实现*/
  @override
  /*在build方法中告诉flutter，我们的widget希望渲染什么元素*/
  Widget build(BuildContext context)
  {
    return MteWidget();
  }
}

//将material的widget重构====>将widget写成单独的一个类
class MteWidget extends StatelessWidget{

  Widget build(BuildContext context)
  {
    return MaterialApp(
      //scaffol快速搭建页面===>脚手架
        home:Scaffold(
          //导航栏 可以不设置
          //AppBar是子类
            appBar: AppBar(),
            //body中间部分的内容
            //将body的center嵌套成一个widget
            body:HYpage()
        )
    );
  }
}

//导航栏的widget重构的类
class Abarpage extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    return AppBar(
        title: Center(
          child:Text(
            "第一个flutter程序",
            style: TextStyle(
                fontSize: 20,
                color: Colors.green
            ),
          ),
        )
    );
  }
}

//主体内容重构的类
class HYpage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    /*
    * 1、center部件中有一个Row组件，其中可以包含多个组件
    * */
    return Center(
        child: Row
        (//此时row这个widget相当于centerwidget而言是居中的
          mainAxisAlignment: MainAxisAlignment.center,//mainAxisAlignment===>主轴====》此处是指在主轴上居中
          //children能够有多个孩子,可以传入一个widget数组
          //<Widget>==>泛型，可加可不加
          children: <Widget>[
            Checkbox(value: true, onChanged: (value)=>print(value)),//value的值=true，当状态改变时，输出value值
            Text("你好！",
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 40,
              ),
            ),
            Text("沈成林！"),
          ],
        )
    );
  }
}