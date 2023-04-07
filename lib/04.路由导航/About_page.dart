import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYAboutPage extends StatelessWidget {
  static const String routeName="/about";//路由名称定义成常量

  @override
  Widget build(BuildContext context) {
    /*ModalRoute.of(context)可以拿到ModalRoute对象*/
    final message=ModalRoute.of(context)?.settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("关于页"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${message}"),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop("我从关于页返回到首页啦！");
                },
                child: Text("返回首页"))
          ],
        ),
      ) ,
    );
  }
}