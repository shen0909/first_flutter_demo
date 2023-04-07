import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*原因:无状态的widget内部不能有任何的状态改变*/
class HYpage extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    /*
    * 1、center部件中有一个Row组件，其中可以包含多个组件
    * Row占据一行,内部是水平排列
    * */
    return Center(
      //此时row这个widget相当于centerwidget而言是居中的,但Row内部的widget并不是====>解决办法  mainAxisAlignment
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,//mainAxisAlignment===>主轴====》此处是指在主轴上居中
          children: [  //children===>能够放多个孩子     children:<Widget> []====>放数组
            Checkbox(value: true, onChanged: (value)=>print(value)),//当发生改变时，打印value值
            /*但：Checkbox(value: true, onChanged: (value)=>print(value))
            * 当发生改变时，打印value值  一直是选中的状态，没有办法变成非选中
            * 原因在于：StatelessWidget状态不能不能改变*/
            Text(
              "你好！",
            ),
            Text("沈成林！"),
          ],//传入一个widget数组
        )
    );
  }
}