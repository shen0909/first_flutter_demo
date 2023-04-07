/*原始指针事件===>Pointer
*
* 在指针落下时，框架做了一个 hit test 的操作，确定与屏幕发生接触的位置上有哪些Widget以及分发给最内部的组件去响应；
*事件会沿着最内部的组件向组件树的根冒泡分发；
*并且不存在用于取消或者停止指针事件进一步分发的机制；
*使用lisener进行监听
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){runApp((MyApp()));}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HYpointerPage());
  }
}
class HYpointerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("监听学习"),
      ),
      body:Center(
        child:PointerListnerDemo()
      ),
    );
  }
}


/*Pointer使用listener来进行监听*/
class PointerListnerDemo extends StatelessWidget {
  const PointerListnerDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        onPointerDown: (event){
          print("指针按下：$event");
        },
        onPointerMove: (event){
          print("指针移动：$event");
        },
        onPointerUp: (event){
          print("指针抬起：$event");
        },
        onPointerCancel: (event){
          print("指针取消：$event");
        },
        child: Container(
          height: 300,
          width: 300,
          color: Colors.red,
        ),
      ),
    );
  }
}

