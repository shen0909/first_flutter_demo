/*1、状态管理
*
* 状态：需要维护的数据
* build方法依赖状态渲染widget
*
* 1、短时状态 Ephemeral state====>只在自己的widget中使用(单一)
* 2、应用状态 App state=====>在多个部件中传递共享
*
*
* 共享状态管理
* InheritedWidget可以实现跨组件之间的数据传递
* */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



/*状态管理
* 1、定义一个继承自InheritedWidget的类
* 1.1 如何让继承自InheritedWidget的类，通过外部点击按钮改变内部的值=======>在构造函数中添加参数*/
main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter_InheritedWidget",
      home: HYhomePage(),
    );
  }
}

/*如果HYshow1和HYshow2 widget都想要共享counter
* ====>则可以以找到HYshow1和HYshow2共同的父widget，包裹一个继承自InheritedWidget的widget*/
class HYhomePage extends StatefulWidget {
  @override
  State<HYhomePage> createState() => _HYhomePageState();
}

class _HYhomePageState extends State<HYhomePage> {

  int _counter=100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter"),
      ),
      body: HYcounterWidget(
        counter: _counter,//将_counter的值传给HYcounterWidget中的counter
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HYshow1(),
              HYshow2(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print("counter+1");
          setState(()=>_counter++);//更新_counter的值
        },
      ),

    );
  }
}

class HYshow1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /*将HYshow1的context传入到HYcounterWidget.of中去，HYcounterWidget.of会往上找最近的父widget，查找里面有没有counter属性*/
    int? counter=HYcounterWidget.of(context)?.counter;//获取HYcounterWidget中的counter
    return Card(
      color: Colors.red,
      child: Text("当前计数：${counter}",style: TextStyle(fontSize: 30),),
    );
  }
}

class HYshow2 extends StatelessWidget {
  const HYshow2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int ? counter=HYcounterWidget.of(context)?.counter;
    return Card(
      color: Colors.red,
      child: Text("当前计数：${counter}",style: TextStyle(fontSize: 30),),
    );
  }
}


/*用来管理counter的类
* 需要找到祖先widget进行共享
* Notes:widget中所有的属性都不能改变*/
class HYcounterWidget extends InheritedWidget{
  //final int counter=100;//需共享的变量
  final int counter;//需共享的变量

  /*用静态的of方法来获取变量
  * 拿到context，使用context.dependOnInheritedWidgetOfExactType()===>沿着element树找到最近的HYcounterWidget，从element中取出widget对象*/
  static HYcounterWidget? of(BuildContext context)
  {
    return context.dependOnInheritedWidgetOfExactType();
  }
  //构造方法==>要求必须传入一个child,把这个孩子交给父类
  HYcounterWidget({required super.child,required this.counter});

  /*updateShouldNotify=====>更新时是否要通知？===>对比新旧的HYcounterWidget，是否需要对更新相关依赖的widget*/
  @override
  bool updateShouldNotify(covariant HYcounterWidget oldWidget) {
    return oldWidget.counter!=counter;
  }
}
