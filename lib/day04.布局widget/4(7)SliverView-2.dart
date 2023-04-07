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
        body:FYHomecontent()
    );
  }
}

class FYHomecontent extends StatefulWidget {
  const FYHomecontent({Key? key}) : super(key: key);

  @override
  State<FYHomecontent> createState() => _FYHomecontentState();
}

class _FYHomecontentState extends State<FYHomecontent> {
  @override
  Widget build(BuildContext context) {

    return CustomScrollViewDemo2() ;
  }
}

class CustomScrollViewDemo2 extends StatelessWidget {
  const CustomScrollViewDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(//可以滚动的导航栏
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("SliverView导航栏",textAlign: TextAlign.end,),
          ),
        ),//
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return Container(
                    color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(257), Random().nextInt(258)),
                  );
                },
              childCount: 10
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100 ,
            )
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext ctx,int index) {
                  return ListTile(
                    leading: Icon(Icons.people,color: Colors.lightBlue,),
                    title:Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("联系人"),
                          Text("123456789")
                        ],
                      ),
                    ) ,
                    trailing: Icon(Icons.delete,color: Colors.grey,),
                  );
                  },
            childCount: 10
        )
        )
      ],
    );
  }
}

class CustomScroliViewDemo1 extends StatelessWidget {
  const CustomScroliViewDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /*SliverSafeArea和SafeArea的区别===>都是可以设置安全区域，但是前者向上滑动时，可以滑上去，后者不行*/
        SliverSafeArea(
          /*SliverPadding和padding的区别====>都可以设置边距，但是前者向上滑动时，没有边距，后者向上滑动，边距依旧存在*/
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),//设置边距
            sliver: SliverGrid(
              /*delegate是SliverChildDelegate类型，但是SliverChildDelegate是一个抽象方法,只能由子类实现
              * 它的子类有SliverChildBuilderDelegate和SliverChildListDelegate(没有前一个好，不好在哪里呢？不知道……)
              * SliverChildBuilderDelegate的参数中，builder是必传参数*/
              delegate:SliverChildBuilderDelegate(
                  childCount: 200,
                      (BuildContext ctx,int index){
                    return Container(
                      color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(257), Random().nextInt(258)),
                    );
                  }
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:10,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              //
            ),
          ),
        )
      ],//不能放普通的widget，要放SliverGrid之类
    );
  }
}


