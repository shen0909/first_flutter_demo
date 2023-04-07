/*Route：一个页面要想被路由统一管理，必须包装为一个Route
*但是Route是一个抽象类，所以它是不能实例化的
*所以查看MaterialPageRoute来使用
*
* Navigator：管理所有的Route的Widget，通过一个Stack(栈)来进行管理的，
* 开发中不需要手动创建Navigator(默认有)*/
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detail.dart';
import 'router/router.dart';

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Route",
      //home: HYpage(),
      /*跳转到详情页的不普通方法*/
      routes:Routers.routes,
      //封装成数组
      /*{
        "/":(ctx)=>HYpage(),
        //"/about":(ctx)=>HYAboutPage(),
        HYAboutPage.routeName:(ctx)=>HYAboutPage(),//路由名称定义成常量
      },*/
      /*onGenerateRoute,路由钩子监听跳转的路由，当跳转的路由在routes中没有配置时就会在这里配置
       *我们可以在该函数中，手动创建对应的Route进行返回；*/
      onGenerateRoute: Routers.GenerateRoute,
          /*(settings){
        if(settings.name =="/detail"){
          return MaterialPageRoute(builder: (context){
            return HYDetailPage("${settings.arguments}");
          });
        }
        return null;
      },*/
      /*当我们打开的路由名称根本不存在时如何跳转到一个统一的错误页面？*/
      onUnknownRoute:Routers.unknowRoute,
          /*(settings){
        return MaterialPageRoute(builder: (context){
          return HYErroPage();
        });
      },*/
    );
  }
}

class HYpage extends StatefulWidget {


  @override
  State<HYpage> createState() => _HYpageState();
}

class _HYpageState extends State<HYpage> {
  String message="此时还什么都没有";
  String data="此时还什么都没有";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("路由与导航")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ElevatedButton(
                  child: Text("跳转到详情页"),
                  //点击按钮跳转到详情页面
                  onPressed: (){
                    _jumpToDetail(context);//跳转到详情页相关代码单独抽成一个方法
                  },
                ),
                SizedBox(width: 10,),
                Text("接收到详情页返回的消息:${message}")
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                ElevatedButton(
                  child: Text("跳转到关于页"),
                  //点击按钮跳转到详情页面
                  onPressed: (){
                    _jumpToAbout(context);//跳转到详情页相关代码单独抽成一个方法
                  },
                ),
                SizedBox(width: 10,),
                Text("接收到关于页返回的消息:${data}")
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                ElevatedButton(
                  child: Text("跳转到详情页2"),
                  //点击按钮跳转到详情页面
                  onPressed: (){
                    _jumpToDetail2(context);//跳转到详情页相关代码单独抽成一个方法
                  },
                ),
              ],
            ),
            ElevatedButton(
              child: Text("跳转到未知页面"),
              //点击按钮跳转到详情页面
              onPressed: (){
                _jumpToErro(context);//跳转到详情页相关代码单独抽成一个方法
              },
            ),
          ],
        ),
      ),
    );
  }

  /*跳转到详情页的方法(普通版)
  * 普通跳转方式怎么传递消息？
  * 在对应的页面中添加一个需要传入信息的构造器*/
  void _jumpToDetail(BuildContext context){

    final future=Navigator.of(context).push(
        MaterialPageRoute(builder: (context)
        {
          return HYDetailPage("不管几岁，快乐万岁");//传入信息到HYDetailPage
        }
        )
    );

    future.then((value) {
      setState(()=>message="${value}");
      print(value);
     }
    );
  }
  /*如果想给某一个路由的名称定义常量，是到对应的页面俩面定义 */
  /*命名路由如何进行参数传递？====>pushNamed中的arguments参数*/
  void _jumpToAbout(BuildContext context) {
    final future=Navigator.of(context).pushNamed("/about",arguments: "我从首页跳转到关于页啦");//根据"/about"找到路径，跳转到about页面
    future.then((value) {
      setState(()=>data="${value}");
      print(value);
    }
    );
  }
  /*命名路由如何对一个有构造器的页面进行参数传递？使用钩子函数onGenerateRoute手动创建对应的Route进行返回*/
  void _jumpToDetail2(BuildContext context){
    final future2=Navigator.of(context).pushNamed("/detail",arguments: "我从首页跳转到详情页面2啦！！");
    future2.then((value) {
      setState(()=>data="${value}");
      print(value);
    }
    );
  }
  /*跳转到未知页面*/
  void _jumpToErro(BuildContext context){
    Navigator.of(context).pushNamed("/cccc");
  }
}