import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYsubjectContent extends StatefulWidget {
  const HYsubjectContent({Key? key}) : super(key: key);

  @override
  State<HYsubjectContent> createState() => _HYsubjectContentState();
}

class _HYsubjectContentState extends State<HYsubjectContent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder:(BuildContext ctx,int index){
          return ListTile(
            title: Text("真实信息"),
          );
        }
       );
  }
}
