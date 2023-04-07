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
    return Row(
      children: [
        Image_network(imag_ulr1: imag_ulr1),
        /*加载本地图片
        * 1、在Flutter项目中创建一个文件夹，用于存储图片
        * 2、在pubspec.yaml中进行配置(配置时注意细节)
        * 3、使用文件*/
        Image_Asset()
      ],
    );
  }
}
/*加载本地图片*/
class Image_Asset extends StatelessWidget {
  const Image_Asset({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/images/01.webp"),
    );
  }
}

/*加载网络图片*/
class Image_network extends StatelessWidget {
  const Image_network({
    Key? key,
    required this.imag_ulr1,
  }) : super(key: key);

  final String imag_ulr1;

  @override
  Widget build(BuildContext context) {
    return Image(
      repeat: ImageRepeat.repeatY,
      image:NetworkImage(imag_ulr1),
      width: 200,
      height:400,
      //fit: BoxFit.contain,//等比拉伸
      fit:BoxFit.fitWidth,  // 宽度一定，高度自适应
      //alignment: Alignment.bottomRight,
      /*自定义对齐 */
      alignment: Alignment(-1,-1),
    );
  }
}





