import 'package:first_flutter_demo/douban/pages/main/main.dart';
import 'package:first_flutter_demo/douban/widgets/dashLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*将评分widget封装成一个单独的组件===>具有通用性*/
main()=>runApp(DouBanAPP());

class DouBanAPP extends StatelessWidget {
  const DouBanAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DouBanDemo",
      theme: ThemeData(
        brightness: Brightness.light ,
        primaryColor: Colors.lightBlue,
        highlightColor: Colors.transparent,//点击时的高亮效果为透明
        splashColor: Colors.transparent//长按的扩散效果为透明
      ),
      home:Scaffold(
        body: HYpage(),
      ),
    );
  }
}

class HYpage extends StatelessWidget {
  const HYpage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HYMainScreen();
  }
}
/*class DashLine extends StatelessWidget {
  const DashLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 1000,
        height: 400,
        color: Colors.lightBlue,
        child:HYDashLine(dashedHeight: 5,count: 20,dasheWidth: 20,) ,),
    );
  }
}*/






