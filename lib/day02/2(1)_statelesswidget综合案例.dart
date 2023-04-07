import 'package:flutter/material.dart';

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYpage(),
    );
  }
}
//首页
class HYpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          /* final Widget? title;======>title这里需要传入的是widget*/
          title:Center(
            child:Text(
              "商品列表展示",
              style:TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ) ,
            ),
          ),
        ),
        body:HYcontent()
    );
  }
}
class HYcontent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(//ListView可以滑动
      //里面可以有多个widget，所以是children
      children: [
        /*问题一：在Flutter布局总，内容是不能超出屏幕范围的，超出时，不会自动变成滚动效果,超出部分会显示黄线*/
        HYproductItem("乌龙茶","特级茶叶-水仙添加","https://img1.baidu.com/it/u=1232972092,315345975&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750"),
        HYproductItem("茶Π","特级茶叶-水仙添加","https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        HYproductItem("你猜","特级茶叶-水仙添加","https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
      ],
    );
  }
}

//首页商品item(单个demo)
class HYproductItem extends StatelessWidget {
  //商品描述
  final String? name;
  final String? desc;
  final String? imageURL;
  //构造函数
  HYproductItem(this.name,this.desc,this.imageURL);

  @override
  Widget build(BuildContext context) {
    final style1=TextStyle(fontSize: 30,color: Colors.lightBlue);
    final style2=TextStyle(fontSize: 15,color: Colors.amber);
    return Container(
      //decoration==>装饰
      decoration: BoxDecoration(
          border: Border.all(
              width: 30,
              color: Colors.amber
          )
      ),
      padding: EdgeInsets.all(1),
      child: Column(
        /*Column默认情况下，主轴上垂直排列，交叉轴上居中显示,如果不想要居中，则自己重写（如下）*/
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name!,
            //style: TextStyle(fontSize: 30, color: Colors.lightBlue),
            // 将TextStyle(fontSize: 30, color: Colors.lightBlue)抽取（抽取时在函数里面是局部变量,最好不要放在全局）
            style: style1,
          ),
          SizedBox(height: 10,),//10个像素
          Text(
            desc!,
            style: style2,
          ),
          SizedBox(height: 30,),
          Image.network(imageURL!)
        ],
      ),
    );
  }
}



