import 'dart:collection';
import 'dart:convert';

import 'package:leshua/style/app_size.dart';
import 'package:leshua/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../config/http_config.dart';
import '../../config/sp_config.dart';
import '../../main.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  const WebViewPage(this.url,{Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late InAppWebViewController _controller;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light
      ),
    );
    var map = {
      'token': SpUtil().getString(spToken),
      'appId': HttpConfig.appId,
      'statusBarHeight' : SizeFit.statusHeight
    };
    return WillPopScope(
      onWillPop: () => _goBack(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: SizeFit.statusHeight,),
            Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(url:Uri.parse(widget.url)),
                  initialUserScripts: UnmodifiableListView<UserScript>([]),
                  onWebViewCreated: (InAppWebViewController controller){
                    _controller = controller;
                    _controller.clearCache();

                    /// 接收WebView的调用
                    _controller.addJavaScriptHandler(handlerName: 'FlutterBridge',
                        callback: (args) {
                      debugPrint('args.length:${args.length}');
                      debugPrint(args.toString());
                      routerDelegate.popRoute();
                    });
                  },
                  onLoadStart: (controller,url) async {
                    debugPrint('------------------------- ${url?.path}');
                  },
                  onLoadStop: (controller,url) async {
                    debugPrint('load stop -${url?.path}');
                    /// 向WebView传递参数
                    controller.evaluateJavascript(source: 'getLocalSet(${json.encode(map)})');
                  },
                  androidOnPermissionRequest: (controller,request,resources) async {
                    return PermissionRequestResponse(
                      resources: resources,
                      action: PermissionRequestResponseAction.GRANT
                    );
                  },
                  onConsoleMessage: (controller,consoleMessage){
                    debugPrint('consoleMessage:${consoleMessage.message}');
                  },
                )
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _goBack() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return false;
    } else {
      return true;
    }
  }
}
