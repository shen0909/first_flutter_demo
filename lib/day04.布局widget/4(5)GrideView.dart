/*滚动的widget
* ListView===>列表滑动
* GridView===>做网格
* Sliver
* 滚动的监听*/
import 'dart:ffi';
import 'dart:math';
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
        title: Center(child: Text("滑动widget")),
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

/*gridDelegate是SliverGridDelegate类型，SliverGridDelegate是一个抽象类，抽象类不能实例化，只能实例化子类
 * 子类一：SliverGridDelegateWithFixedCrossAxisCount   固定放在交叉轴上item的个数
 * 子类二：SliverGridDelegateWithMaxCrossAxisExtent    每个item放在交叉轴上的宽度，然后flutter自己设计放置几个*/
class FYHomecontent extends StatefulWidget {
  const FYHomecontent({Key? key}) : super(key: key);

  @override
  State<FYHomecontent> createState() => _FYHomecontentState();
}

class _FYHomecontentState extends State<FYHomecontent> {
  @override
  Widget build(BuildContext context) {


    //return GridViewDemo1();
    //return GridViewDemo1();
    return GridViewDemo3() ;
  }
}
/*GridView.builder*/
class GridViewDemo3 extends StatelessWidget {
  const GridViewDemo3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 3,
            mainAxisSpacing: 4
        ),
        itemBuilder: (BuildContext ctx,int index)//传入一个匿名的回调函数
        {
          //return Image(image: AssetImage("assets/images/01.webp"));
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(257), Random().nextInt(258)),
          );
        }
    );
  }
}

class GridViewDemo2 extends StatelessWidget {
  const GridViewDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      /*实例化另一个子类SliverGridDelegateWithMaxCrossAxisExtent*/
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,//每个item的宽度最大为100
        ),
        children:List.generate(100, (index) => Image(image: AssetImage("assets/images/01.webp")))
    );
  }
}

class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      /*GridView有一个必须要传入的参数====>required this.gridDelegate,
      *gridDelegate是SliverGridDelegate类型，SliverGridDelegate是一个抽象类，抽象类不能实例化，只能实例化子类
      * 子类一：SliverGridDelegateWithFixedCrossAxisCount   固定放在交叉轴上item的个数
      * 子类二：SliverGridDelegateWithMaxCrossAxisExtent    每个item放在交叉轴上的宽度，然后flutter自己设计放置几个*/
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,//交叉轴上放置3个item
            childAspectRatio: 1,//宽度除以高度的比例是1.5
            crossAxisSpacing: 5,//交叉轴上的item间距
            mainAxisSpacing: 3//主轴上item的间距
        ),
        children:List.generate(100, (index) => Image(image: AssetImage("assets/images/01.webp")))
    );
  }
}

