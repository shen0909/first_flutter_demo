import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'initial_list_item.dart';

class HYMainScreen extends StatefulWidget {
  const HYMainScreen({Key? key}) : super(key: key);

  @override
  State<HYMainScreen> createState() => _HYMainScreenState();
}
//double _width=30;
class _HYMainScreenState extends State<HYMainScreen> {
  int _currentpage=0;
  //页面切换
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //根据不同的index显示不同的页面
      body: IndexedStack(
        index: _currentpage,
        /*抽取成数组pages*/
        /*children: [
          HYhomePage(),
          HYhomePage(),
          HYhomePage(),
          HYhomePage(),
          HYhomePage(),
          HYhomePage(),
        ],*///不同的也面
        children: pages,
      ),

      /*底部导航栏设置*/
      bottomNavigationBar: BottomNavigationBar(
        /*BottomNavigationBar的特性：超过四个item会隐藏文字====>所以要加上这段文字  type: BottomNavigationBarType.fixed,*/
        type: BottomNavigationBarType.fixed,
        items: listItems,
        currentIndex: _currentpage,
        selectedItemColor: Colors.green,//选中item的字体颜色
        selectedFontSize: 14,//选中item的字体大小
        unselectedFontSize: 14,//未选中item的字体大小
        //index是数组位序
        onTap: (index){
          setState((){
            _currentpage=index;
          });
        },
        //封装item
        /*items: [
          //封装成类===>HYBottonBarItem()
        /*BottomNavigationBarItem(
              icon: Image.asset("assets/tabbar/home.png",width: _width,),
              activeIcon: Image.asset("assets/tabbar/home_active.png",width: _width,),
              label: "首页"
          ),*/
        //封装到list数组
          /*HYBottonBarItem("home", "首页", 32),
          HYBottonBarItem("subject", "书影音", 32),
          HYBottonBarItem("group", "小组", 32),
          HYBottonBarItem("mall", "市集", 32),
          HYBottonBarItem("profile", "我的", 32),*/
        ],*/
      ),
    );
  }
}


