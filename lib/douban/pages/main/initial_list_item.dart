import 'package:first_flutter_demo/douban/pages/mall/mall.dart';
import 'package:first_flutter_demo/douban/pages/subject/subject.dart';
import 'package:flutter/cupertino.dart';

import '../group/group.dart';
import '../home/home.dart';
import '../profile/profile.dart';
import 'buttom_tabbar_item.dart';

List<HYBottonBarItem> listItems=[
  HYBottonBarItem("home", "首页", 32),
  HYBottonBarItem("subject", "书影音", 32),
  HYBottonBarItem("group", "小组", 32),
  HYBottonBarItem("mall", "市集", 32),
  HYBottonBarItem("profile", "我的", 32),
];

List<Widget> pages=[
  HYhomePage(),//首页
  HYsubjectpage(),//书影音
  HYgourpPage(),//群组
  HYmallPage(),//市集
  HYprofilePage(),//我的
];