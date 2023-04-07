import 'package:flutter/material.dart';

main()=>runApp(MyApp());
/*直接在runApp()中传入Text，渲染出错
* Text widget 并不是一个可以渲染的widget===>Text本质上渲染的是RichText*/
//main()=>runApp(Text("文本"));

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
          title: Center(child: Text("基本widget")),
        ),
        body:FYHomecontent()
    ) ;
  }
}
/*首页主体内容*/
class FYHomecontent extends StatefulWidget {
  const FYHomecontent({Key? key}) : super(key: key);
  @override
  State<FYHomecontent> createState() => _FYHomecontentState();
}
//首页主体内容的state
class _FYHomecontentState extends State<FYHomecontent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextDemo(),
        /*一行文本有不同的颜色*/
        /*！！富文本 Text.rich中必选参数textSpan是InlineSpan类型，而InlineSpan是一个抽象类，抽象类不能够用普通方法进行实例化（工厂方法可以），只能传抽象类的子类*/
        Text.rich(
            textAlign: TextAlign.left,
            TextSpan(
              children: [
                TextSpan(
                    text: "定风波 苏轼\n莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
                    style: TextStyle(color: Colors.green,)
                ),
                WidgetSpan(child: Icon(Icons.favorite,color: Colors.green,)),
                TextSpan(
                    text: "\n明月几时有，把酒问青天。不知天上宫阙，今夕是何年？\n我欲乘风归去，又恐琼楼玉宇，高处不胜寒。起舞弄清影，何似在人间。\n转朱阁，低绮户，照无眠。不应有恨，何事长向别时圆？\n人有悲欢离合，月有阴晴圆缺，此事古难全。但愿人长久，千里共婵娟。"
                ),
              ],
            )
        )
      ],
    );
  }
}
//将文本类型单独抽取成一个widget
class TextDemo extends StatelessWidget {
  const TextDemo({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "定风波 苏轼\n莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
        /*文本格式
         * TextAlign.center===>当文本框占据一整行时，对于文本框中的内容居中才会有效*/
        textAlign: TextAlign.left,//文本对齐
        /*最大行数maxLine===>最大占据几行*/
        maxLines: 4,
        //未被显示的内容用省略号表示
        //overflow: TextOverflow.ellipsis,
        /*缩放因子===>1 表示不缩放*/
        textScaleFactor: 2,
        /*文本样式*/
        style: TextStyle(
          fontSize: 10,
          color: Colors.deepOrange,
          fontWeight: FontWeight.bold,
          //fontFamily: //字体：第三方和外部引用都可
        ),
      ),
    );
  }
}



