import 'package:leshua/style/app_style.dart';
import 'package:leshua/utils/sp_util.dart';
import 'package:dio/dio.dart';
import 'package:leshua/config/http_config.dart';
import 'package:leshua/config/sp_config.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler){
     options.connectTimeout = HttpConfig.timeOut;
     options.receiveTimeout = HttpConfig.timeOut;
     options.baseUrl = HttpConfig.baseUrl;
     options.headers = getHeader();
     return handler.next(options);
  }

  Map<String,dynamic> getHeader() {
    Map<String,dynamic> headers = {
      'platform': SizeFit.isIOS ? 'ios' : 'android',
      'versionauth': '1.0.0',
      'appId': HttpConfig.appId,
      'Authentication': SpUtil().getString(spToken)
    };
    return headers;
  }
}