import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYDashLine extends StatelessWidget {

  final Axis axis;//虚线方向
  final double dasheWidth;//虚线宽度
  final double dashedHeight;//虚线高度
  final int count;
  final Color color;//虚线颜色

  HYDashLine({
    this.axis=Axis.horizontal,  this.dasheWidth=10,  this.dashedHeight=10,  this.count=10, this.color=Colors.red,
  });

  /*利用sizebox*/
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,//主轴上的对齐方式===>平分
      children: List.generate(count, (_) {
        return SizedBox(
          width: dasheWidth,
          height: dashedHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          ),
        );
      }),
    );
  }
}