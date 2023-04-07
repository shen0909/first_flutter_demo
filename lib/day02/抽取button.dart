/*下划线开头：说明 在其他库中不能够访问？
widget前面不能加下划线，因为它要暴露给别人*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '2(1)_statelesswidget综合案例.dart';

class HYcontent extends StatefulWidget {
  const HYcontent({Key? key}) : super(key: key);
  //createState()是必须实现的
  @override
  State<HYcontent> createState() => _HYcontentState();
}

class _HYcontentState extends State<HYcontent> {
  /*为什么StatefulWidget的build方法在widget里面？
  * 1、因为build出来的widget是需要依赖State中的变量(状态/数据)
  * 2、在flutter的运行过程中，widget会不断地销毁创建，而当我们自己的状态发生改变时，并不希望重新创建一个新的state*/
  //定义一个变量（var和具体类型是冲突的 如：var和int不能同时写）

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            _getButton(),
            Text(
              "计算结果：",
              style: TextStyle(textBaseline: TextBaseline.ideographic),
            )
          ],
        )
    );
  }

  Widget _getButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: ()=>print("小杨点击了＋"),
            style: ButtonStyle(
              //backgroundColor: Colors.green,
              backgroundColor: MaterialStateProperty.all(Color(0xffEDFCF5)),
            ),
            child: Text(
              "+",
              style: TextStyle(
                color: Colors.black,
              ),
            )
        ),
        ElevatedButton(
            onPressed: ()=>print("小杨点击了-"),
            child: Text("-")),//此处的child能够放一个widget==>图标、文字都可以
      ],
    );
  }
}