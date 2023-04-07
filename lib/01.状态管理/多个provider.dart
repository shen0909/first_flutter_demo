import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ViewModel/counter_view_model.dart';
import 'ViewModel/user_view_model.dart';
/*状态管理
* 2、provider
* Tep1 添加provider依赖
* Tep2 在APP最顶层包裹一个provider======>ChangeNotifierProvider===>Widget树中提供数据（状态）的地方，会在其中创建对应的ChangeNotifier
* */
/*
* 1、创建自己需要共享的数据===>vi  ewModel
* 2、在应用程序的顶层包裹ChangeNotifierProvider
* 3、在其他位置使用共享的数据
* 3.1  Provider.of====>数据发生改变，使用该方法的整个build都会被重新执行
* 3.2  Consumer(使用更多)
* 3.3  Selector*/
main(){
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx)=>HYCounterViewModel()),
          ChangeNotifierProvider(create: (ctx)=>UserInfoModel()),
        ],
        child: MyApp(),
     )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter_InheritedWidget",
      home: HYhomePage(),
    );
  }
}
/*使用consumer floatingActionButton的build每次都会重新执行
* 改进====>使用selector===>对原有的数据进行转换
* 关键点1：泛型参数是两个
* 泛型参数一：我们这次要使用的Provider
* 泛型参数二：转换之后的数据类型，比如我这里转换之后依然是使用CounterProvider，那么他们两个就是一样的类型
* 关键点2：selector回调函数
* 转换的回调函数，你希望如何进行转换
* S Function(BuildContext, A) selector
*我这里没有进行转换，所以直接将A实例返回即可
*关键点3：是否希望重新rebuild
*这里也是一个回调函数，我们可以拿到转换前后的两个实例；
*bool Function(T previous, T next);
*因为这里我不希望它重新rebuild，无论数据如何变化，所以这里我直接return false；
*/
/*对原有的类型进行转换，A转换成S*/

class HYhomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("flutter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HYshow01(),
              HYshow02(),
              HYshow03(),
              HYshow04(),
            ],
          ),
        ),
        /*修改数据===>Consumer
    * Consumer的builder方法解析：
    * 参数一：context，每个build方法都会有上下文，目的是知道当前树的位置
    * 参数二：ChangeNotifier对应的实例，也是我们在builder函数中主要使用的对象
    * 参数三：child，目的是进行优化，如果builder下面有一颗庞大的子树，当模型发生改变的时候，我们并不希望重新build这颗子树，那么就可以将这颗子树放到Consumer的child中，在这里直接引入即可（注意我案例中的Icon所放的位置）*/
        floatingActionButton:Selector<HYCounterViewModel,HYCounterViewModel>(
          selector: (context,couterSelector)=>couterSelector,
          shouldRebuild: (pre,next)=>false,
          builder: (context,counterVM,child){
            print("floatingActionButton的build方法被执行");
            return FloatingActionButton(
              onPressed: (){
                counterVM.counter++;//获取ChangeNotifier中的数据
              },
              child: Icon(Icons.add),
            );
          },
        )

    );
  }
}

class HYshow01 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("HYshow01使用的：Provider.of");
    //3.1 使用数据  Provider.of
    int counter=Provider.of<HYCounterViewModel>(context).counter;
    return Card(
      color: Colors.red,
      child: Text("当前计数：$counter",style: TextStyle(fontSize: 30),),
    );
  }
}

class HYshow02 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("HYshow02使用的：Consumer");
    /*3.1*/
    //int counter=Provider.of<HYCounterViewModel>(context).counter;
    /*3.2 包裹一个consumer*/
    //int ? counter=HYcounterWidget.of(context)?.counter;
    return Card(
        color: Colors.blue,
        child: Consumer<HYCounterViewModel>(
          builder: (context,counterVM2,child){
            return Text("当前计数：${counterVM2.counter}",style: TextStyle(fontSize: 30),);//返回一个widget
          },
        )
    );
  }
}

class HYshow03 extends StatelessWidget {
  const HYshow03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Consumer<UserInfoModel>(
        builder: (context,userinfoVM,child){
          return Text("nickName:${userinfoVM.user.nickname},level:${userinfoVM.user.level}",style: TextStyle(fontSize: 30),);
        },
      ),
    );
  }
}

/*使用两个model中的数据*/
class HYshow04 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Consumer2<UserInfoModel,HYCounterViewModel>(
        builder: (context,userinfoVM,counterVM4,child){
          return Text("nickName:${userinfoVM.user.nickname},level:${userinfoVM.user.level},counter:${counterVM4.counter}",style: TextStyle(fontSize: 30),);
        },
      ),
    );
  }
}



