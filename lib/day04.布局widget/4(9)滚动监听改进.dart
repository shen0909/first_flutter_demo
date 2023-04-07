import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*监听滚动的方法
* 方法一：controller
* 1、可以设置默认值offset
* 2、能够监听滚动也能够监听滚动的位置
* 3、但是不能监听什么时候开始、结束滚动
* 方法二：NotificationListener
* 1、监听开始滚动结束滚动*/
/*！！！改进：使用NotificationListener进行监听*/
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
              //print("监听滚动到了……:${controller.offset}");
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
      /*NotificationListener是一个widget*/
      body:NotificationListener(
        onNotification:(ScrollNotification notification){
          if(notification is ScrollStartNotification)
            print("开始滚动");
          else if(notification is ScrollUpdateNotification)
            print("正在滚动，当前滚动位置为：${notification.metrics.pixels},总滚动的距离：${notification.metrics.maxScrollExtent}");
          else if(notification is ScrollEndNotification)
            print("结束滚动");

          /* 返回一个bool值，返回 trueReturn true to cancel the notification bubbling. Return false to allow thenotification to continue to be dispatched to further ancestors.*/
          return true;

        },
        child: ListView.builder(
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
        ),
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


