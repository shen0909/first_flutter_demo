/*手势Gesture
* 点击
* 双击
* 长按
* ……*/


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
      /*在Container外面包裹Container会导致最里面被包裹的那个Container占满外部的Container
      * 如何解决？
      * 1、将外层的Container用Column代替
      * 2、设置一个alignment: Alignment.center
      *
      * 监听内部Container的点击===》不用冒泡 */
      /*点击内部偶然也会把数据传到外面
      * 如何解决？
      * 不要让两个之间是嵌套关系====>使用stack*/
      body:Center(
        child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTapDown: (details){
                  print("点击外部");
                },
                child: Container(
                  color: Colors.blue,
                  height: 500,
                  width: 500,
                  alignment: Alignment.center,
                ),
              ),
              GestureDetector(
                onTapDown: (details){
                  print("点击内部");
                },
                child: Container(
                  color: Colors.red,
                  height: 100,
                  width: 300,
                ),
              ),
            ]
        ),
      ),
    );
  }
}

/*没有内外嵌套*/
class GestureDemo extends StatelessWidget {
  /*
  *globalPosition用于获取相对于屏幕的位置信息
  * localPosition用于获取相对于当前Widget的位置信息*/
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        print("手指点击");
      },//用户点击事件完成
      onTapUp:(detail){
        print("手指抬起：${detail.globalPosition}");
      },//手指抬起
      onTapDown:(detail){
        print("\n手指按下在屏幕上的位置：${detail.globalPosition}\n在widget中的位置：${detail.localPosition}");
      },//手指按下
      onDoubleTap:()=>print("手指双击"),//手指双击
      onTapCancel: ()=>print("手势取消"),
      onLongPress: (){
        print("手指长按");
      },
      child: Center(
        child: Container(
          height: 400,
          width: 500,
          color: Colors.orange,
        ),
      ),
    );
  }
}