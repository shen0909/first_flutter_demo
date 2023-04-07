import 'package:first_flutter_demo/douban/pages/profile/profile_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutterapp/douban/pages/profile/profile_content.dart';

class HYprofilePage extends StatelessWidget {
  const HYprofilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("个人信息"),),),
      body: HYProfileContent(),
    );
  }
}
