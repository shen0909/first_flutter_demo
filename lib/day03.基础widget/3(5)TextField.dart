import 'dart:ffi';

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
  final usernameController=TextEditingController();
  final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFiledDemo(usernameController: usernameController, passwordController: passwordController);
  }
}

class TextFiledDemo extends StatelessWidget {
  const TextFiledDemo({
    Key? key,
    required this.usernameController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: usernameController,//相当于将TextField绑定给了TextEditingController
            decoration: InputDecoration(
              labelText: "用户名",
              icon: Icon(Icons.people),
              hintText: "请输入用户名",
              border: OutlineInputBorder(),
            ),
            //监听用户输入的东西
            onChanged: (value)=>print("用户名onChanged:$value"),
            //用户提交数据
            onSubmitted: (value)=>print("用户名onSubmitted:$value"),
          ),
          SizedBox(height: 10,),

          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "密码",
              icon: Icon(Icons.password),
              hintText: "请输入密码",
              border: OutlineInputBorder(),
            ),
            onChanged: (value)=>print("密码onChanged:$value"),
            onSubmitted: (value)=>print("密码onSubmitted:$value"),
          ),
          SizedBox(height: 30,),
          Container(
            width: double.infinity,//填充父容器
            height: 40,
            child: ElevatedButton(
              /*点击按钮，获取输入的内容
              * 在全局变量中创建TextEditingController*/
              onPressed: (){
                //获取用户名和密码
                final username=usernameController.text;
                final password=passwordController.text;
                print("登录成功：\n用户名：$username,密码：$password");
              },
              child: Text(
                "登录",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}







