/*滚动的widget
* ListView
* GridView
* Sliver
* 滚动的监听*/
import 'dart:ffi';
import 'package:flutter/material.dart';

main()=>runApp(MyApp());

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
        onPressed: (){print("点击了浮动按钮");},
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

class _FYHomecontentState extends State<FYHomecontent> {
  @override
  Widget build(BuildContext context) {

    return ListViewDemo();
  }
}

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);
  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

/*class _ListViewDemoState extends State<ListViewDemo> {
  bool _delete=false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      *//*List.generate创建多个列表项
      * index后面传入匿名函数*//*
      //children: List.generate(100, (index) => Text(("$index、小杨生日快乐！"),style: TextStyle(color: Colors.red),))
    *//*改进 ListTile*//*
      children:List.generate(100, (index) => ListTile
        (
        leading:Icon(Icons.people,color: Colors.lightBlue,) ,//开头放什么
        trailing:Icon(Icons.delete),//结尾放什么
        //主标题
        title:Text(
            "联系人",
            textAlign: TextAlign.left,
          ) ,

        subtitle:Text("第${index+1}位联系人电话号码：10000000") ,//副标题
      )
      ),
      //scrollDirection: Axis.horizontal,//设置水平滑动方向
      scrollDirection: Axis.vertical,
      itemExtent: 50,//设置每个子项的所占据的宽度=====>如果没有设置那就是默认高度
    );
  }
}*/

class _ListViewDemoState extends State<ListViewDemo> {
  bool _delete=false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      /*List.generate可以创建多个列表项，能够在index后面传入匿名函数*/
      //children: List.generate(100, (index) => Text(("$index、小杨生日快乐！"),style: TextStyle(color: Colors.red),))
      /*改进 ListTile*/
      scrollDirection: Axis.vertical,
      itemExtent: 50,//设置每个子项的所占据的宽度=====>如果没有设置那就是默认高度
      children:List.generate(100, (index) => ListTile(
        leading:Icon(Icons.people,color: Colors.lightBlue,) ,//开头放什么
        trailing:IconButton(
          icon: Icon(Icons.delete),
          //点击事件发生时，_delete取反===>初始时flase（未删除），点击后变成true(已删除)
          onPressed:(){
            print("_delete初始状态：$_delete");
            setState((){_delete=!_delete;});
            if(_delete==true) print(("_delete的状态为$_delete,成功删除联系人方式"));
          } ,
        ) ,//结尾放什么
        title:Text("联系人") ,//主题
        subtitle:Text("第${index+1}位联系人电话号码：10000000") ,//副标题
      )
      ),
    );
  }
}

