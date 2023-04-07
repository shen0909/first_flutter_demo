import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../01.状态管理/ViewModel/user_view_model.dart';
/*跨组件事件
*1、创建一个全局的eventbus对象
* 2、监听事件类型（开发中一般不是监听一个单一类型而是监听一个类）*/
final eventbus=EventBus();

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "widget之间的数据传递",
      home: HYpage(),
    );
  }
}

class HYpage extends StatelessWidget {
  const HYpage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget之间的数据传递"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HYButton(),
            HYtext(),
          ],
        ),
      ),
    );
  }
}

/*点击一个widget，另外一个widget做出反应
* 以往的办法：传回调函数====>如onPress(),但这样可能会传好几层
* 新办法：even_bus 事件总线===>进行全局事件的监听传递*/

/*需求：
有两个Widget 一个是Button 、一个是Text
点击按钮的时候 显示Text数据内容*/
class HYButton extends StatelessWidget {
  const HYButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          final info=UserInfo("沈成林",20);
          //eventbus.fire("你好！杨滨溶");//发出事件(单一类型)
          eventbus.fire(info);
        },
        child: Text("Button"));
  }
}

class HYtext extends StatefulWidget {
  const HYtext({Key? key}) : super(key: key);

  @override
  State<HYtext> createState() => _HYtextState();
}
class _HYtextState extends State<HYtext> {

  var data="Hello word";

  /*2、监听事件类型*/
  void initState(){
    super.initState();
    /*监听单一类型*/
    /*eventbus.on<String>().listen((event) {
      setState((){
        this.data="${event}";
      });
      print(event);
    }
    );*/
    /*监听对象*/
    eventbus.on<UserInfo>().listen((event) {
      print(event);//拿到一个UserInfo的对象
      //更新数据data1571817467aaa
      setState((){
        this.data="${event.nickname}  ${event.level}";
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Text("${data}",style: TextStyle(fontSize: 30),);
  }
}

