import 'package:flutter/material.dart';

main()
{
  runApp(
      MaterialApp(
        home:Scaffold(//scaffol快速搭建页面===>脚手架
          //导航栏 可以不设置
          //AppBar是子类====>导航栏（可以不设置）
          appBar: AppBar(
              title: Center(
                child:Text("第一个flutter程序",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green
                  ),
                ),
              )
          ),
          //body中间部分的内容
          body: Center(
            /*在Text小部件外部包含一个Center部件，让Text作为其child
            * Text()函数中有许多参数（必传参数和可选参数）*/
              child: Text(
                "小杨要开始学Flutter了", //必选参数
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,//字体
                    color: Colors.amber
                ),//Colors是个类,类中包含许多静态属性
              )
          ),
          drawer: Drawer(),//左边出现抽屉式控件
        ),
      )
  );
}