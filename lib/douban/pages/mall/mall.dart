import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mall_content.dart';

class HYmallPage extends StatelessWidget {
  const HYmallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("市集"),),),
      body:HYmallPageContent() ,
    );
  }
}
