import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'subject_content.dart';

class HYsubjectpage extends StatefulWidget {
  const HYsubjectpage({Key? key}) : super(key: key);

  @override
  State<HYsubjectpage> createState() => _HYsubjectpageState();
}

class _HYsubjectpageState extends State<HYsubjectpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("书影音")),
      ),
      body: HYsubjectContent(),
    );
  }
}
