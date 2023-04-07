import 'package:flutter/material.dart';

main(){
  //1、runAPP()函数：运行一个应用程序（是一个全局函数）
  //runApp要求传入一个widget,万物皆是widget
  //但widget是一个abstract是一个抽象类，抽象类不能够被实例化，所以可以创建它的子类
  runApp(
    //Text类继承自widget
    //调用的是构造方法
    // Text()构造函数中有许多参数（必传参数和可选参数）
    Text(
          "小杨要开始学Flutter了",//必选参数
          /*可选参数
          * textDirection ===>要求传入的是一个TextDirection
          * style=====>要求传入的是一个TextStyle
          * textAlign=====>要求传入的是一个TextAlign
          * 等*/
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: TextStyle
            (
                fontSize: 30,//字体
                color: Colors.amber//字体颜色
            ),//Colors是个类,类中包含许多静态属性
          )
  );
}

