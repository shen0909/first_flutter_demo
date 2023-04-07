/*
*首页网络请求
* */
import '../douban/model/home_model.dart';
import 'http_request.dart';

class HomeRequest{

  //返回一个Future,Future里存放的是MovieItem数组=====>List<MovieItem>
  static Future<List<MovieItem>> requestMovieList() async{
    //1、构建URL
    /*start===>想从哪里开始请求
    * count===>请求多少条数据*/
    //String movieURL=" https://api.covid19api.com/summary";
    final movieURL="/search_subjects?type=movie&tag=%E7%83%AD%E9%97%A8&sort=recommend&page_limit=100&page_start=0";

    //HttpRequest.request(movieURL).then((value) => print(value));
    //2、发送网络请求，获取结果给result
    final result=await HttpRequest.request(movieURL);//能够请求到结果
    final subjects=result["subjects"];//将获取结果中的subjects赋值给 定义的subjects
    print(subjects);//打印出的是一个JSON类型
    //3、将Map转成Model
    List<MovieItem> movies = [];//空数组
    //将subjects中的数据放到空数组中
    for (var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }
    /*此时显示的并不是真实的数据，而是模型对象====>怎样显示真实的内容呢？====>重写toString方法*/
    //print("存入数组中的内容：$movies");
    return movies;//会自动包装成Future
  }
}