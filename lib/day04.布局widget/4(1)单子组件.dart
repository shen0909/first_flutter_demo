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
  var _num=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "按钮展示",
          style: TextStyle(
              fontSize: 30,
              color: Colors.redAccent
          ),
        ),
        /*Button
        * 1、ElevatedButton*/
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: ()=>setState(()=>_num++),
              child: Icon(Icons.add),
            ),
            ElevatedButton(
                onPressed:()=>setState(()=>_num--),
                child:
                Text(
                  "-",
                  style:TextStyle(
                    fontSize: 20,

                  ) ,
                ))
          ],
        ),
        Text("总计是:$_num",
          textAlign: TextAlign.left,
        ),
        /*2、FlagButton*/
        /*3、OutLineButton 边框按钮*/
        OutlinedButton(
          onPressed: () { print("点击OutlinedButton"); },
          child: Text("OutlinedButton"),
        ),
        /*自定义button 图标+文字+背景+文字*/
        /*如何设置button的长、宽？===>可以在在外部包裹一个Container,在Container中去设置*/
        Container(
          width: 400,
          height: 100,
          child: ElevatedButton(
            onPressed: (){print("点击自定义Button");},
            style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all(Colors.green),//背景色
                shape: MaterialStateProperty.all(//设置圆角
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    )
                )
            ),

            child:
            Row(//Row默认是占据整行的，所以此处自定义的button在主轴上是占据整行的位置
                mainAxisSize: MainAxisSize.min,//在主轴上占据最小位置
                children: [
                  Icon(Icons.add),
                  Text("自定义"),
                ]
            ),

          ),
        )
      ],
    );
  }
}





