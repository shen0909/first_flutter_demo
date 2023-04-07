import 'package:flutter/cupertino.dart';

class HYGroupContent extends StatefulWidget {
  const HYGroupContent({Key? key}) : super(key: key);

  @override
  State<HYGroupContent> createState() => _HYGroupContentState();
}

class _HYGroupContentState extends State<HYGroupContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("你的群组我的群组大家都不同",style: TextStyle(fontSize: 30),),
    );
  }
}
