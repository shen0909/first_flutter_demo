import 'package:flutter/cupertino.dart';

class HYmallPageContent extends StatefulWidget {
  const HYmallPageContent({Key? key}) : super(key: key);

  @override
  State<HYmallPageContent> createState() => _HYmallPageContentState();
}

class _HYmallPageContentState extends State<HYmallPageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("这里要卖些什么"),);
  }
}
