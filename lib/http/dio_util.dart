import 'dart:convert';

import 'package:leshua/http/error_interceptor.dart';
import 'package:leshua/http/log_interceptor.dart';
import 'package:leshua/utils/sp_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/component/toast_show.dart';
import 'package:leshua/config/http_config.dart';
import 'package:leshua/http/header%20_interceptor.dart';
import 'package:leshua/model/common_bean_entity.dart';

class DioUtil {
  static DioUtil? _instance;
  Dio? _dio;
  BaseOptions? baseOptions;
  final CancelToken _cancelToken = CancelToken();

  static DioUtil? getInstance() {
    _instance ??= DioUtil();
    return _instance;
  }

  get dio => _dio;

  DioUtil() {
    baseOptions = BaseOptions(
        baseUrl: HttpConfig.baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 5000,
        responseType: ResponseType.json);
    _dio = Dio(baseOptions ?? BaseOptions());

    _dio?.interceptors.add(HeaderInterceptor());
    /// 添加请求失败拦截器
    _dio?.interceptors.add(ErrorInterceptor());

    /// 添加网络缓存拦截器
    //_dio?.interceptors.add(NetCacheInterceptor());

    /// 添加日志拦截器
    _dio?.interceptors.add(LogInterceptor1());

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    // if (PROXY_ENABLE) {
    //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //       (client) {
    //     client.findProxy = (uri) {
    //       return "PROXY $PROXY_IP:$PROXY_PORT";
    //     };
    //     //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;
    //   };
    // }
  }

  /// get方式请求
  get(String url,
      {Map<String, dynamic>? params,
      Options? options,
      CancelToken? cancelToken}) async {
    Response? response;
    response = await _dio?.get(url,
        queryParameters: params,
        options: options,
        cancelToken: cancelToken ?? _cancelToken);
    return response?.data;
  }

  /// post方式请求
  Future<CommonBeanEntity?> post(String url,
      {data,
      Map<String,dynamic>? params,
      Options? options,
        bool form = true,
      CancelToken? cancelToken}) async {
    EasyLoading.show(dismissOnTap: true);
    Response? response;
    response = await _dio?.post(url,
        data: form ? '' : params,
        queryParameters: form ? params : {},
        options: options,
        cancelToken: cancelToken ?? _cancelToken);
    var entity = CommonBeanEntity.fromJson(response?.data);
    if(entity.code == 200){
      EasyLoading.dismiss();
      return entity;
    }else{
      EasyLoading.dismiss();
      MyToast.showToast(entity.message ?? '请求失败');
      return CommonBeanEntity();
    }
  }

  /// put
  Future put(String path,
      {data,
      Map<String, dynamic>? params,
      Options? options,
      CancelToken? cancelToken}) async {
    var response = await _dio?.put(path,
        data: data,
        queryParameters: params,
        options: options,
        cancelToken: cancelToken ?? _cancelToken);
    return response?.data;
  }

  /// 表单提交操作
  Future postForm(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var response = await _dio?.post(path,
        data: FormData.fromMap(params!),
        options: options,
        cancelToken: cancelToken ?? _cancelToken);
    return response?.data;
  }
}
