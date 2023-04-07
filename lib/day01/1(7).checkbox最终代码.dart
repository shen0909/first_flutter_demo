/*checkbox最终代码*/
import 'package:flutter/material.dart';
import '1(5).Checkbox代码一.dart';
main()=> runApp(MyApp());//箭头函数：只有一句话
/*
* 有状态的widget：statefulwidget    在运行过程中有一些状态的改变
* 无状态的widget：statelesswidget   运行过程中没有状态的改变
* */


//将material的widget重构
class MteWidget extends StatelessWidget{

  Widget build(BuildContext context)
  {
    return MaterialApp(
      //scaffol快速搭建页面===>脚手架
        home:Scaffold(
          //导航栏 可以不设置
          //AppBar是子类
            appBar: AppBar(),
            //body中间部分的内容
            //将body的center嵌套成一个widget==>HYpage()
            body:HYpage()
        )
    );
  }
}

//导航栏的widget重构的类
class Abarpage extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    return AppBar(
        title: Center(
          child:Text(
            "第一个flutter程序",
            style: TextStyle(
                fontSize: 20,
                color: Colors.green
            ),
          ),
        )
    );
  }
}

//主体内容重构的类
/*checkbox案例*/
/*center中的子组件Row里面可以存放多个组件*/

/*由于StatefulWidget类不能定义状态，所以->单独创建一个类，用于负责维护状态*/
/*定义状态的不是widget，而是state类*/
class HYpage extends StatefulWidget{
  State<StatefulWidget> createState(){
    return HYpageState();
  }
}

//定义的维护状态的类
//由于State类内部也有一个抽象方法还未实现==>Widget build(BuildContext context);===>因此子类必须要实现
class HYpageState extends State<StatefulWidget>{
  var flag=true;//定义状态
  Widget build(BuildContext context)
  {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,//主轴上居中
        children: [
          Checkbox(
            value: flag,//var flag=true;====>value也=true
            onChanged: (value){
              /*但此时并没有改变选中框，必须要调用setState，监听值的改变，刷新界面*/
              setState(
                      ()=>flag=value!//setState调用匿名函数，flag=value取反
                   );
              print(flag);
            },
            checkColor: Colors.deepOrange,
          ),
          Text(
            "同意协议",
            style:TextStyle(
                fontSize: 40
            ) ,
          )
        ],
      ),
    );
  }
}