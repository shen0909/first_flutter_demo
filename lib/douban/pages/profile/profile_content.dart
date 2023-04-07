import 'package:flutter/cupertino.dart';

class HYProfileContent extends StatefulWidget {
  const HYProfileContent({Key? key}) : super(key: key);

  @override
  State<HYProfileContent> createState() => _HYProfileContentState();
}

class _HYProfileContentState extends State<HYProfileContent> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("个人信息"),);
  }
}
