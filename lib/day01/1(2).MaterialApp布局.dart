import 'package:flutter/material.dart';

main(){
  //1、runAPP()函数：运行一个应用程序（是一个全局函数）
  //runApp要求传入一个widget,万物皆是widget
  //但widget是一个abstract是一个抽象类，抽象类不能够被实例化，所以可以创建它的子类
  runApp(
    /*优化一：使用material布局===>material布局是Google设置的布局
    * 能够显示导航栏*/
    MaterialApp(
      /*home:是该应用启动时现实的页面*/
      home:Center(
        /*在Text小部件外部包含一个center部件，让Text作为其child====>在center布局的里面放一个Text部件*/
          child: Text("小杨要开始学Flutter了",//必选参数
          //因为material中对文字有默认的设计风格==>从左到右  textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 30,//字体
              color: Colors.amber//Colors是个枚举类,类中包含许多静态属性
              ),
          )
      )
    )

  );
}

