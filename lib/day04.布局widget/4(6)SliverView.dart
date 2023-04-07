/*ListView
* class ListView extends BoxScrollView====>ListView继承自BoxScrollView
* abstract class BoxScrollView extends ScrollView======>抽象类BoxScrollView继承自ScrollView
* abstract class ScrollView extends StatelessWidget=====>抽象类ScrollView继承自StatelessWidget
* 所以ListView真正调用的是StatelessWidget里面的build方法
* build方法里面有一个十分重要的===final List<Widget> slivers = buildSlivers(context);
* 不管是ListView GridView 都要调用buildSlivers，这才是真正可以滚动的东西
* 在ScrollView中的buildSlivers方法是一个没有实现的抽象方法
* 所以必须让ScrollView的子类实现====》
* 子类一：BoxScrollView(子类三四，同时也是子类一的子类)
* 子类二：CustomScrollView
* 子类三：GridView
* 子类四：ListView
* 子类一：BoxScrollView是如何实现抽象方法拿到子类的？
* 它在List<Widget> buildSlivers(BuildContext context) 函数中声明了Widget sliver = buildChildLayout(context);调用buildChildLayout方法
* 将sliver放到数组中返回====>所以BoxScrollView只有一个sliver====>这样就不t能满足开发时有多个滑动的要求
* 解决办法==>CustomScrollView里面可以传入多个slivers*/
