// import 'dart:convert';
//
// import 'package:base_component/style/app_style.dart';
// import 'package:base_component/utils/sp_util.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:leshua/config/http_config.dart';
// import 'package:leshua/config/sp_config.dart';
// import 'package:leshua/main.dart';
// import 'package:leshua/pages/webview/webview_config.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class WebViewPage extends StatefulWidget {
//   final String url;
//
//   const WebViewPage(this.url,{Key? key}) : super(key: key);
//
//   @override
//   State<WebViewPage> createState() => _WebViewPageState();
// }
//
// class _WebViewPageState extends State<WebViewPage> {
//
//
//   late WebViewController controller;
//   late WebViewController _webViewController;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewConfig().getWebViewController(widget.url);
//     controller.setNavigationDelegate(
//       NavigationDelegate(
//         onProgress: (int progress) {
//           debugPrint('WebView is loading (progress : $progress%)');
//         },
//         onPageStarted: (String url) {
//           debugPrint('Page started loading: $url');
//         },
//         onPageFinished: (String url) {
//           debugPrint('Page finished loading: $url');
//           var map = {
//             'token': SpUtil().getString(spToken),
//             'appId': HttpConfig.appId,
//             'statusBarHeight' : SizeFit.statusHeight
//           };
//           _webViewController.runJavaScript('getLocalSet(${json.encode(map)})');
//         },
//         onWebResourceError: (WebResourceError error) {
//           debugPrint('''
//               Page resource error:
//               code: ${error.errorCode}
//               description: ${error.description}
//               errorType: ${error.errorType}
//               isForMainFrame: ${error.isForMainFrame}
//           ''');
//         },
//       ),
//     );
//     controller.addJavaScriptChannel(
//         'FlutterBridge', onMessageReceived: (message) {
//       if (message.message == '来自JS的数据') {
//         routerDelegate.popRoute();
//       }
//     });
//     _webViewController = controller;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(
//           statusBarColor: Colors.white,
//           statusBarIconBrightness: Brightness.dark,
//           statusBarBrightness: Brightness.light
//       ),
//     );
//     return WillPopScope(
//       onWillPop: () => _goBack(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             SizedBox(height: SizeFit.statusHeight,),
//             Expanded(child: WebViewWidget(controller: controller)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<bool> _goBack() async {
//     if (await controller.canGoBack()) {
//       controller.goBack();
//       return false;
//     } else {
//       return true;
//     }
//   }
// }
