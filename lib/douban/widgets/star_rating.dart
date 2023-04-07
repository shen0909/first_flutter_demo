/*自行封装==>评分widget*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYStarRating extends StatefulWidget {
  final double rating;//评分
  final double maxrating;//最高分
  final int count;//星星个数
  final double size;//星星大小
  final Color unselectedColor;//为选中时的颜色
  final Color selectedColor;//为选中时的颜色
  final Widget unselectedImage;
  final Widget selectedImage;
  /*构造函数
  * 可选参数*/
  HYStarRating({
    required this.rating, //必须要传入自己的评分
    this.maxrating=100, //默认最高分为100
    this.count=5, //默认星星个数为5个
    this.size=30, //默认星星大小为30
    this.unselectedColor=const Color(0xffbbbbbb),//默认
    this.selectedColor=Colors.red,//默认选中时的颜色是红色
    Widget ? unselectedImage,//自己传入背景
    Widget ? selectedImage,
  }):unselectedImage=unselectedImage ??Icon(Icons.star_border,color: unselectedColor,size: size,),/*初始化列表，unselectedImage为空时选择后面的*/
        selectedImage=selectedImage ?? Icon(Icons.star,color: selectedColor,size: size,)
  {
    print("当前评分为：$rating,满分为：$maxrating,星星个数为：$count");
  }

  @override
  State<HYStarRating> createState() => _HYStarRatingState();
}
/*state如何取到widget中的变量？
* widget.参数*/
class _HYStarRatingState extends State<HYStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          /*children: [
            */
          /*Icon(Icons.star_border,color: widget.unselectedColor,size: widget.size,),
            Icon(Icons.star_border,color: widget.unselectedColor,size: widget.size,),
            Icon(Icons.star_border,color: widget.unselectedColor,size: widget.size,),
            Icon(Icons.star_border,color: widget.unselectedColor,size: widget.size,),
            Icon(Icons.star_border,color: widget.unselectedColor,size: widget.size,),
            Icon(Icons.star_border,color: widget.unselectedColor,size: widget.size,),*//*
          ],*/
          //传入widget.count(星星个数)，将Icon(Icons.star_border,color: widget.unselectedColor,size: widget.size,)执行widget.count次
          //抽取函数
          //children: List.generate(widget.count, (index) => Icon(Icons.star_border,color: widget.unselectedColor,size: widget.size,),),
          children:buildUnselectedStar() ,//构建未选中星星
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          /*children:
          /* Icon(Icons.star,color: Colors.red,size: 50,),
           */
            Icon(Icons.star,color: Colors.red,size: 50,),
            Icon(Icons.star,color: Colors.red,size: 50,),
            Icon(Icons.star,color: Colors.red,size: 50,),*//*
            Icon(Icons.star,color: widget.selectedColor,size: widget.size,),
            Icon(Icons.star,color: widget.selectedColor,size: widget.size,),
          ],*/
          //抽取函数
          // children: List.generate(widget.count, (index) => Icon(Icons.star,color: widget.selectedColor,size: widget.size,),),
          children: buildselectedStar(),//构建选中星星
        )
      ],
    );
  }

  List<Widget> buildUnselectedStar()
  {
    return List.generate(widget.count, (index) => Icon(Icons.star_border,color: widget.unselectedColor,size: widget.size,),);
  }
  /*如何确定选中的星星数量？*/
  List<Widget> buildselectedStar()
  {
    final star=Icon(Icons.star,color: widget.selectedColor,size: widget.size,);
    //return List.generate(widget.count, (index) => Icon(Icons.star,color: widget.selectedColor,size: widget.size,),);
    /*1、第一步 构建星星数组*/
    List<Widget>stars=[];
    /*2、第二步 构建满填充的星星====>最高评分/所给评分向下取整*/
    double onStar=widget.maxrating/widget.count;//一个星星所占的分数
    print("一个星星所占分数：$onStar");
    int entireCount=(widget.rating/onStar).floor();//所给出的分数占多少个完整的星星====>评分/一个星星所占分数向下取整
    print("当前评分占据$entireCount颗整星");
    for(int i=0;i<entireCount;i++)
    {
      stars.add(star);
    }
    /*3、第三步 构建部分填充的星星
    * 裁剪星星*/
    //不完整的星星的大小
    double leftWidth=((widget.rating/onStar)-entireCount)*widget.size;//评分总共占据多少颗星星，减去完整的星星个数
    print("当前评分占据${widget.rating/onStar-entireCount}颗非整星");
    final halfstar=ClipRect(child: star, clipper:HYStarClipper(leftWidth),);
    stars.add(halfstar);//如何裁剪

    return stars;//返回星星数组
  }
}
/*自定义裁剪函数*/
class HYStarClipper extends CustomClipper<Rect>{
  double width;//接受半星的大小
  HYStarClipper(this.width);
  /*传入一个矩形*/
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTRB(0, 0, width, size.height);//return Rect.fromLTRB(left, top, right, bottom);====>左，顶，右，底
    throw UnimplementedError();
  }
  /*是否要重新裁剪*/
  @override
  bool shouldReclip(HYStarClipper oldClipper) {//传过来一个旧的clipper
    // TODO: implement shouldReclip
    return oldClipper.width !=this.width;//当旧的width和当前新传入的width不相等时要重新裁剪
    throw UnimplementedError();
  }
}