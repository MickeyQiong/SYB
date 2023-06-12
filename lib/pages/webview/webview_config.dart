import 'package:flutter/material.dart';
import 'package:leshua/config/http_config.dart';
import 'package:leshua/main.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';


/// 商户进件
String url = '${HttpConfig.webViewUrl}/entryIndex';
/// 银行卡管理
String bankCardUrl = '${HttpConfig.webViewUrl}/redirectIndex?url=bank';
/// 查看限额
String normUrl = '${HttpConfig.webViewUrl}/redirectIndex?url=norm';
/// 设置
String settingUrl = '${HttpConfig.webViewUrl}/setIndex';
/// 用户协议
String userAgreementUrl = '${HttpConfig.webViewUrl}/userAgreement';
/// 隐私协议
String rivacyAgreementUrl = '${HttpConfig.webViewUrl}/rivacyAgreement';
/// 账单记录
String billRecordUrl = '${HttpConfig.webViewUrl}/redirectIndex?url=bill';
/// 交易记录
String tradeRecordUrl = '${HttpConfig.webViewUrl}/redirectIndex?url=trade';


class WebViewConfig {
  WebViewController getWebViewController(String url){
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(url));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    return controller;
  }
}