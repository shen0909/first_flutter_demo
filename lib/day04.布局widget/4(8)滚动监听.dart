import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*监听滚动的方法
* 方法一：controller
* 1、可以设置默认值offset
* 2、能够监听滚动也能够监听滚动的位置
* 3、但是不能监听什么时候开始、结束滚动
* 方法二：NotificationListener
* 1、监听开始滚动结束滚动*/

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"滚动监听",
      home:HYHomePage(),
    );
  }
}

class HYHomePage extends StatefulWidget {
  const HYHomePage({Key? key}) : super(key: key);
  @override
  State<HYHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  bool _isShowFloat=false;
  ScrollController controller=ScrollController(initialScrollOffset: 1000);//初始滚动偏移100
  void initState()
  {
    super.initState();
    controller.addListener(
            () {
          print("监听滚动到了……:${controller.offset}");
          /*监听controller.offset，当它>100时，_isShowFloat=true===>显示浮动按钮*/
          setState((){
            _isShowFloat=controller.offset>=100;
          });
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动监听Demo"),
      ),
      body:ListView.builder(
          controller: controller,
          itemExtent: 50,
          itemCount: 500,
          itemBuilder: (BuildContext ctx,int index)
          {
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
          }
      ) ,
      /*改进一：当item过多时才显示浮动按钮
      * _isShowFloat?FloatingActionButton():null====>
      * A? B1:B2=======>当A的值为true时，使用B1的值,当A的值为假时，使用B2的值*/
      floatingActionButton: _isShowFloat?FloatingActionButton(
        //浮动按钮被点击时，List回到顶部
        onPressed: () {
          /*直接跳的两种方式*/
          //controller.jumpTo(value)
          /*controller.animateTo(offset, duration: duration, curve: curve)
          *offset==>滚动到哪里
          *duration===>时间
          *curve====>动画速率    */
          controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeInToLinear);
          print("点击时，返回到顶部"); },
        child: Icon(Icons.arrow_upward,color: Colors.black,),
      ):null,
    );
  }
}


