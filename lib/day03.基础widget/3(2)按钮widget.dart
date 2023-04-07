import 'dart:ffi';

import 'package:flutter/material.dart';
/*按钮
* 1、ElevatedButton
* 2、边框按钮：OutlinedButton
* 3、浮动按钮：FloatingActionButton*/
main()=>runApp(MyApp());
/*直接在runApp()中传入Text，渲染出错*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FYHomepage(),
    );
  }
}
/*主页结构*/
class FYHomepage extends StatelessWidget {
  const FYHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("布局widget")),
      ),
      body:FYHomecontent(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child:Icon(Icons.add),
        foregroundColor: Colors.white,
      ),
      //浮动按钮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,//靠近最下面
    ) ;
  }
}
/*首页主体内容*/
class FYHomecontent extends StatefulWidget {
  const FYHomecontent({Key? key}) : super(key: key);

  @override
  State<FYHomecontent> createState() => _FYHomecontentState();
}
/*Flex布局====>Row  Column都是继承于这个布局
* Row使用主轴
* Column使用交叉轴*/
class _FYHomecontentState extends State<FYHomecontent> {
  @override
  Widget build(BuildContext context) {
    //return Flex(direction: Axis.vertical);//=Row(Axis.horizontal=column)

    /** Row的特点：水平方向尽可能占据比较大的空间，垂直方向包裹内容
        如何实现水平方向包裹内容？===>mainAxisSize: MainAxisSize.min,
        MainAxisAlignment:主轴的属性
     * start：沿着主轴开始的方向挨个拜访元素
     * end:沿着主轴结束的方向，挨个……
     * center：在主轴的中心点向两边拜访
     * spaceBetween：左右两边的间距为0，其他元素之间平分间距
     * spaceAround:左右两边的间距是其他元素之间的间距的一般
     * spaceEvenly:所有的间距进行平分
        -CrossAxisAlignment：交叉轴的属性
     *start:交叉轴的起始位置对齐
     *end:交叉轴的结束位置对齐
     *baseline:基线对齐（必须有文本时才能起效果 ）
     *stretch:拉伸*/
    return RowDemo3();
  }
}
/*点击收藏照片，变颜色*/
class RowDemo3 extends StatefulWidget {


  const RowDemo3({
    Key? key,
  }) : super(key: key);

  @override
  State<RowDemo3> createState() => _RowDemo3State();
}

class _RowDemo3State extends State<RowDemo3> {
  /*判断颜色的bool值*/
  bool _isFavo=false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image:AssetImage("assets/images/02.webp"),
          width:600,
          height: 800,
          fit:BoxFit.fitWidth ,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Color.fromARGB(50, 0, 0, 0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text("喜欢",style: TextStyle(color: Colors.white ),),
                  SizedBox(width: 10,),
                  IconButton(
                    icon: Icon(
                        Icons.favorite,
                        color: _isFavo? Colors.red:Colors.white),/*_isFavo为true时(确认收藏)，颜色是红色，_isFavo为false时(未被收藏)，颜色时白色*/
                    onPressed: (){
                      setState((){
                        _isFavo =!_isFavo;//_isFavo取反
                      });
                      if(_isFavo==true) print("收藏成功");
                      if(_isFavo==false)print("取消收藏");
                    },
                  )
                ],
              ),
            ),
          ),)
      ],
    );
  }
}








