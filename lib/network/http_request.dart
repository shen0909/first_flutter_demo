/*封装网络请求
* 可以封装成类*/

import 'package:dio/dio.dart';

import 'http_config.dart';

class HttpRequest {

  /*String url===>网址
  * method====>请求方式
  * {String method="get"}    命名可选参数，默认请求方式是get
  * Map<String,dynamic>? params}  可以为空*/
  //Dio有基本的配置

  /*1、创建实例对象*/
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL,
      connectTimeout: Duration(milliseconds: HttpConfig.timeout)
  ); //基本设置

  static final Dio dio = Dio(baseOptions);
  //static final Dio dio = Dio();

  //由于是异步请求，所以使用Future<T>
  static Future<T> request<T>(
      String url,//必选参数
      {//可选参数
        String method = "get",
        Map<String, dynamic>? params,
        Interceptor? inter
      }
    ) async {
    //1、单独配置
    final options = Options(method: method);

    //全局拦截器
    /*创建默认的全局拦截器*/
    Interceptor Inter=InterceptorsWrapper(
      onRequest: (requet,handle){
        print("请求拦截");
        print("访问网络：${requet.uri}");
        return handle.next(requet);
      },
      onResponse: (response,handle){
        print("响应拦截");
        return handle.next(response);
      },
      onError: (e,handler){
        print("错误拦截");
        return handler.next(e);
      }
    );
    List<Interceptor> inters=[Inter];
    //请求单独拦截器
    if(inter!=null){
      inters.add(inter);
    }
    //统一添加到拦截器中
    dio.interceptors.addAll(inters);

    //2、发送网络请求
    /*可能出现错误，所以使用try捕捉异常*/
    try {
      Response response = await dio.request<T>(
          url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      print("出错了");
      return Future.error(e);
    }
  }
}
