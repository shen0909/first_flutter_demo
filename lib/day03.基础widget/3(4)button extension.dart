import 'package:flutter/material.dart';
/*按钮
* 1、ElevatedButton
* 2、边框按钮：OutlinedButton
* 3、浮动按钮：FloatingActionButton*/
main()=>runApp(MyApp());
/*直接在runApp()中传入Text，渲染出错*/

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
//首页主体内容的state
class _FYHomecontentState extends State<FYHomecontent> {
  final imag_ulr1="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Feed99eae-8995-4e89-ac38-14e36d011572%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1682229253&t=d3adda1fabb26a3551b4ff663f1ff0e3";

  @override
  Widget build(BuildContext context) {
    //1、图片占位图
    return Column(
      children: [
        ImageExtensionDemo(imag_ulr1: imag_ulr1),
        /*Icon字体图标和图片图标
        * 1、字体图标矢量图（放大的时候不会失真）
        * 2、字体图标可以设置颜色
        * 3、图标很多时，占据的空间会更小*/
        Icon(Icons.ac_unit,color: Colors.lightBlue,size: 50,),
        Icon(Icons.ac_unit,color: Colors.red,size: 50,)
      ],
    );
  }
}

class ImageExtensionDemo extends StatelessWidget {
  const ImageExtensionDemo({
    Key? key,
    required this.imag_ulr1,
  }) : super(key: key);

  final String imag_ulr1;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        width: 900,
        height: 500,
        fadeOutDuration: Duration(milliseconds: 200),
        fadeInDuration: Duration(milliseconds: 1),
        placeholder: AssetImage("assets/images/01.webp"),//首先显示placeholder图片，等网络图片加载完成后显示image
        image: NetworkImage(imag_ulr1)
    );
  }
}





