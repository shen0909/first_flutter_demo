import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYErroPage extends StatelessWidget {
  const HYErroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("错误页面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ERRO!!!ERRO!!!",style: TextStyle(fontSize: 30,color: Colors.red),)
          ],
        ),
      ),
    );
  }
}
