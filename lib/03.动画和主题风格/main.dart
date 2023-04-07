import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//动画实际就是通过创建一个动画对象，Flutter根据动画对象中不同的值给对应的Widget进行渲染，进而实现变化
/*动画
* 1、Animation类（是个抽象类）
  addListener方法：每当动画的状态值发生变化时，动画都会通知所有通过 addListener 添加的监听器。
  通常，一个正在监听动画的state对象会调用自身的setState方法，将自身传入这些监听器的回调函数来通知 widget 系统需要根据新状态值进行重新构建。
  addStatusListener方法：当动画的状态发生变化时，会通知所有通过 addStatusListener 添加的监听器。
通常情况下，动画会从 dismissed 状态开始，表示它处于变化区间的开始点。
举例来说，从 0.0 到 1.0 的动画在 dismissed 状态时的值应该是 0.0。
动画进行的下一状态可能是 forward（比如从 0.0 到 1.0）或者 reverse（比如从 1.0 到 0.0）。
最终，如果动画到达其区间的结束点（比如 1.0），则动画会变成 completed 状态。
*
*2、AnimationController类继承自Animation类，实现动画需要创建一个AnimationController对象
**有一个必传的参数vsync===> Flutter每次渲染一帧画面之前都需要等待一个vsync信号。
**这里也是为了监听vsync信号，当Flutter开发的应用程序不再接受同步信号时（比如锁屏或退到后台），那么继续执行动画会消耗性能。
**这个时候我们设置了Ticker，就不会再出发动画了。
*
* 3、CurvedAnimation也是Animation的一个实现类，它的目的是为了给AnimationController增加动画曲线：=====>设置动画执行的速率
*
* 4、Tween：设置动画执行的value范围
*
* //只有在收到同步信号时才会进行绘制
    final controller=AnimationController(vsync:this);
    CurvedAnimation(parent:controller,curve: Curves.easeInToLinear);//给controller添加动画速率
    Tween(begin: 100,end: 200).animate(controller);//将Tween和controller 联系起来
* */
main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: HYHomePage(),
    );
  }
}
/*心跳动画：由小变大 由大变小*/
class HYHomePage extends StatefulWidget{
  @override
  State<HYHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> with SingleTickerProviderStateMixin{
  //Tep1、创建AnimationController,创建动画对象
  //(全局变量)
  late AnimationController _controller;
  late Animation<double>  animation;
  //late Animation sizeAnim;

  @override
  void initState() {
    super.initState();
    _controller=AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 100),//变化时间
        lowerBound: 0.0,//被忽略值
        upperBound: 1.0,//已完成值
    );//this 只能在方法中用

    //Tep2、设置curve值(但是记住不能用之前的controller，因为它是匀速的)
    animation=CurvedAnimation(parent: _controller,curve: Curves.elasticInOut);
    //Tep3、设置Tween
    animation=  Tween(begin: 390.0,end: 400.0).animate(animation);
    //Tep4、设置动画的翻转
    animation.addStatusListener((status) {
      if(status==AnimationStatus.completed){//当动画完成时
        _controller.reverse();
      }
      else if(status==AnimationStatus.dismissed){//当动画未完成时，继续向前执行
        _controller.forward();
      }
    });
    //Tep、（动画的值在改变但是画面没有改变）监听动画值的改变，重新构建状态
    animation.addListener(() {
      setState((){
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Icon(Icons.favorite,color: Colors.red,size:animation.value,),
        /*如何由小变大*/
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
          print("执行动画");
          //_controller.forward();//向前执行动画
          /*点击按钮暂停和开始*/
          if(_controller.isAnimating)//如果正在执行动画
            _controller.stop();//则暂停
          else
            _controller.forward();
        },
      ),
    );
  }
}