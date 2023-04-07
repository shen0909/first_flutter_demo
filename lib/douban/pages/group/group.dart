import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'group_content.dart';
class HYgourpPage extends StatelessWidget {
  const HYgourpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("群组"),),),
      body:HYGroupContent(),
    );
  }
}
