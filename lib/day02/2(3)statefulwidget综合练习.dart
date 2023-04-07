import 'package:flutter/material.dart';

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYpage(),
    );
  }
}
//首页
class HYpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title这里需要传入的是widget
        title:Center(
          child:Text(
            "计数器案例",
            style:TextStyle(
                fontSize: 20,
                color: Colors.white
            ) ,
          ),
        ),
      ),
      body:HYcontent(),
    );
  }
}

class HYcontent extends StatefulWidget {
  const HYcontent({Key? key}) : super(key: key);
  //createState()是必须实现的
  @override
  State<HYcontent> createState() => _HYcontentState();
}
/*下划线开头：说明 在其他库中不能够访问？
widget前面不能加下划线，因为它要暴露给别人*/
class _HYcontentState extends State<HYcontent> {
  /*为什么StatefulWidget的build方法在widget里面？
  * 1、因为build出来的widget是需要依赖State中的变量(状态/数据)
  * 2、在flutter的运行过程中，widget会不断地销毁创建，而当我们自己的状态发生改变时，并不希望重新创建一个新的state*/

  //定义一个变量（var和具体类型是冲突的 如：var和int不能同时写）
  var num=0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
/*可以将有关button的代码抽取出来-见抽取文档*/
            _getButton(),
            Text(
              "计算结果:$num",
              style: TextStyle(
                  textBaseline: TextBaseline.ideographic,
                  fontSize: 20
              ),
            )
          ],
        )
    );
  }
  //抽取和button有关内容==>避免之前的行文太过复杂
  Widget _getButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,//水平居中
      children: [
        ElevatedButton(
          /* required VoidCallback? onPressed,
          * typedef VoidCallback = void Function();
          * 所以onPressed需要传入一个回调函数，onPressed属性==>当按钮被点击时传入一个回调函数*/
            onPressed: ()
            {
              setState(()=>num++);//数字++
              print("小杨点击了+");
            },
            style: ButtonStyle//设置按钮类型
            (
              //backgroundColor: Colors.green,
              backgroundColor: MaterialStateProperty.all(Color(0xffEDFCF5)),
            ),
            child: Text
            (
              "+",
              style: TextStyle
              (
                color: Colors.black,
              ),
            )
        ),
        ElevatedButton(
          //onPressed传入的是一个函数
          //此处使用的是匿名函数
            onPressed: (){
              setState(()=>num--);
              print("小杨点击了-");
            },
            child: Text("-")),//此处的child能够放一个widget==>图标、文字都可以
      ],
    );
  }
}
