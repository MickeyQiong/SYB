import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LogInterceptor1 extends Interceptor {

  final _limitLength = 800;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('----------↓↓↓↓-请求数据-↓↓↓↓----------');
    debugPrint("请求header:${options.headers.toString()}");
    debugPrint('请求url:${options.path}');
    debugPrint('请参数:${options.data.toString()}');
    debugPrint('----------↑↑↑↑-请求数据-↑↑↑↑----------');
    handler.next(options);
  }

  @override
  void onResponse(Response response,ResponseInterceptorHandler handler) async {
    debugPrint('----------↓↓↓↓-请求结果-↓↓↓↓----------');
    debugPrint(response.realUri.toString());
    debugPrint('请求结果：');
    printResponseData(response.data.toString());
    debugPrint('----------↑↑↑↑-请求结果-↑↑↑↑----------');
    handler.next(response);
  }

  /// 打印返回的数据
  void printResponseData(String msg){
    if(msg.length < _limitLength){
      debugPrint(msg);
    }else{
      segmentationLog(msg);
    }
  }

  /// 把超出长度限制的log，分割进行打印
  void segmentationLog(String msg) {
    var outStr = StringBuffer();
    for (var index = 0; index < msg.length; index++) {
      outStr.write(msg[index]);
      if (index % _limitLength == 0 && index!=0) {
        debugPrint(outStr.toString());
        outStr.clear();
        var lastIndex = index+1;
        if(msg.length-lastIndex<_limitLength){
          var remainderStr = msg.substring(lastIndex,msg.length);
          debugPrint(remainderStr);
          break;
        }
      }
    }
  }
}