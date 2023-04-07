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

class _FYHomecontentState extends State<FYHomecontent> {
  @override
  Widget build(BuildContext context) {

    return ListViewseparatedDemo();
  }
}

class ListViewseparatedDemo extends StatelessWidget {
  const ListViewseparatedDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 200,//item个数
      itemBuilder:(BuildContext build,int index){
        return Text("朱一龙的第${index+1}位粉丝在线观看",style: TextStyle(fontSize: 20),);//返回一个widget
      } ,//回调函数
      separatorBuilder: (BuildContext build,int index){
        return Divider(
          color: Colors.lightBlue,
          height: 20,//改变每个item的高度
        );
      },//分割线

    );
  }
}

class ListView_buildDemo extends StatefulWidget {
  const ListView_buildDemo({Key? key}) : super(key: key);

  @override
  State<ListView_buildDemo> createState() => _ListView_buildDemoState();
}

class _ListView_buildDemoState extends State<ListView_buildDemo> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //itemCount:item的个数
        itemCount: 100,
        // itemExtent:item展示的范围（高度）
        itemExtent: 30,
        /*required IndexedWidgetBuilder itemBuilder,
        *typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);
        *itemBuilder是IndexedWidgetBuilder类型，而IndexedWidgetBuilder是给函数 Widget Function(BuildContext context, int index)起的别名
        * 所以，此处要求传入一个回调函数，当有一个item会被展示在屏幕上时会调用这个回调函数*/
        //此时传入的参数===>BuildContext build,int index
        itemBuilder: (BuildContext build,int index){
          return Text("朱一龙的第${index+1}位粉丝在线观看",style: TextStyle(fontSize: 20),);//返回一个widget
        }
    );
  }
}




