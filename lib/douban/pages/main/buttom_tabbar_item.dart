import 'package:flutter/cupertino.dart';

class HYBottonBarItem extends BottomNavigationBarItem{
  /*三个参数：
  * 图片名，文字，大小
  * label 文字
  * icon 未选中时图标
  * activeIcon 选中时图标*/
  HYBottonBarItem(String iconName,String title,double _width):super(
    label: "$title",
    icon: Image.asset("assets/tabbar/$iconName.png",width: _width,),
    activeIcon: Image.asset("assets/tabbar/${iconName}_active.png",width: _width,),
  );

}