import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("这里是导航栏"),
        ),
        body: TThomeContent(),
      ),
    );
  }
}

/*StatefulWidget生命周期*/
class TThomeContent extends StatefulWidget {
  //第一步调用构造函数
  TThomeContent() {
    print("第一步、调用TThomeContent的构造方法");
  }
  @override
  State<TThomeContent> createState() {
    print("第二步、调用TThomeContent的createState方法");
    //将创建的state返回
    return _TThomeContentState();
  } //第二步调用createState()构造方法，进而调用
}

class _TThomeContentState extends State<TThomeContent> {
  _TThomeContentState() {
    print("第三步、调用_TThomeContentState的构造方法");
  }
  void initState() {
    //这里必须调用super====>因为源码中说明 @mustCallSuper===>在实现时，必须调用super，且需要父类帮忙进行初始化
    super.initState();
    print("第四步、调用_TThomeContentState的initState方法");
  }
  void dispose() {
    print("第六步、调用dispose方法");
  }
  //改变依赖===>当依赖的数据发生改变时，就会调用这个方法
  void didChangeDependencies(){
    super.didChangeDependencies();
    print("状态发生改变了，调用了_TThomeContentState中的didChangeDependencies方法");
  }
  /*当父widget出发重建时会调用  更新widget*/
  void diduUpdateWidget(_TThomeContentState oldWidget) {
    super.didChangeDependencies();
    print("父widget重建，diduUpdateWidget");
  }

  @override
  var num=0;
  Widget build(BuildContext context) {

    print("第五步、调用build方法");
    return Column(
      children: [
        ElevatedButton(
            onPressed:(){
              /*手动调用setState方法，根据最新的数据重新调用新的build
              setState()函数可以重新刷新build*/
              setState(()=> num++);
            },
            child: Icon(Icons.add)
        ),
        Text("点击了$num下")
      ],
    );
  }

}
