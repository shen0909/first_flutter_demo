import 'dart:ffi';

import 'package:flutter/material.dart';
/*d多子组件
* 使用children[]属性*/
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
    return RowDemo2();
  }
}

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 100,height: 80, color: Colors.orange, child: Text("第一个垂直container"),),
        Container(width: 90,height: 100, color: Colors.red, child: Text("第二个垂直container"),),
        Container(width: 80,height: 120, color: Colors.pink, child: Text("第三个垂直container"),),
      ],
    );
  }
}

class RowDemo extends StatelessWidget {
  const RowDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //将剩余的空间平均分配给widget做间距
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,//平分间距
      //mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 200,
          height: 180,
          //color: Colors.orange,
          child: Text("第一个水平container",),
          decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/images/01.webp"),
              )
          ),
        ),

        /*Flexible===>不为container设置固定的宽度，而是占据剩余部分（占据比例）
        * -flex:占据剩下空间的比例
        *Expanded=Flexible(fit: FlexFit.tight,*/
        /*两个Flexible*/
        /*Stack默认的大小是包裹内容的
        * aligment:从什么时候开始排布所有的子widget
        * fit:expandert 将子元素拉大尽可能大
        * overflow：超出部分如何处理 */
        Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(width: 90,height: 100, color: Colors.red, child: Text("第二个水平container"),)
        ),
        Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Container(width: 80,height: 120, color: Colors.pink, child: Text("第三个水平container"),)
        ),
      ],
    );
  }
}

/*Stack默认的大小是包裹内容的
 * aligment:从什么时候开始排布所有的子widget
 * fit:expandert 将子元素拉大尽可能大
 * overflow：超出部分如何处理
 * Positioned:可以决定Stack中组件的位置,(且只能在Stack中使用)*/
class RowDemo2 extends StatelessWidget {
  const RowDemo2({
    Key? key,
  }) : super(key: key);

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
                  Icon(Icons.favorite,color: Colors.white,)
                ],
              ),
            ),
          ),)
      ],
    );
  }
}








