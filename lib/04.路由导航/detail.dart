import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*详情页面*/
/*详情页在导航栏默认会有一个返回到首页的按钮
* 自定义的从详情页返回到首页可以传递信息，可是这个默认的按钮应该如何接受信息呢？
* 方法一：自定义一个返回到首页的按钮
* 方法二：监听返回按钮的点击=====>给Scaffold包裹一个WillPopScope
* WillPopScope有一个onWillPop的回调函数，当我们点击返回按钮时会执行
这个函数要求有一个Future的返回值：
true：那么系统会自动帮我们执行pop操作
false：系统不再执行pop操作，需要我们自己来执行*/


class HYDetailPage extends StatelessWidget {
  String message;


   HYDetailPage(this.message);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //onWillPop有一个future 布尔类型的返回
      //当返回为true时，可以自动返回
      //当返回为false时，自行写返回代码
      onWillPop: (){
        _jumpToHome(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          //方法一自定义一个返回到首页的按钮
          /*leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: ()=>_jumpToHome(context),
          ),*/
          title: Text("详情页"),
        ),
        body: Center(
          child: Column
            (
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
              children:[
              Text("$message",style: TextStyle(fontSize: 30),),
              ElevatedButton(onPressed:()=>_jumpToHome(context), child: Text("回到首页")),]
          ),
        ),
      ),
    );
  }
  /*详情页返回到首页时？
  * 页面跳转时会返回一个Future*/
  _jumpToHome(BuildContext context){
    print("回到首页");
    Navigator.of(context).pop("我从详情页返回到首页啦！！");
  }
}

