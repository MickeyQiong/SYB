import 'package:leshua/style/app_color.dart';
import 'package:leshua/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/component/large_button.dart';
import 'package:leshua/config/sp_config.dart';
import 'package:leshua/main.dart';
import 'package:leshua/pages/my/account_management.dart';
import 'package:leshua/pages/webview/webview_config.dart';
import 'package:leshua/riverpod/login_riverpod.dart';
import 'package:leshua/style/app_image.dart';
import 'package:leshua/style/app_size.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../component/action_alert.dart';
import 'login/modify_password.dart';
import 'webview/webview1.dart';

var versionProvider = StateProvider((ref) => '');

class MyPage extends ConsumerWidget {
  MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    getVersion().then((value) => ref.read(versionProvider.notifier).state = value);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: commonText('我的',color: MyColor.white,size: 18),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF17CDC6),Color(0xFF36EA98)])
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            _top(ref),
            const SizedBox(height: 20,),
            _bottom(context,ref)
          ],
        ),
      )
    );
  }

  Widget _top(WidgetRef ref){
    return Container(
      decoration:  const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF17CDC6),Color(0xFF36EA98)])
      ),
      height: 80,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Image.asset(MyImage.myAvatar,width: 50,height: 50),
          SizeFit.sizedBoxW10,
          commonText(SpUtil().getString(spUsername) ?? SpUtil().getString(spPhone) ?? '',color: MyColor.white)
        ],
      ),
    );
  }

  Widget _bottom(BuildContext context,WidgetRef ref){
    return Expanded(
      child: ListView(
        children: [
          //_bottomItem(context, '我的账单',() => routerDelegate.push(WebViewPage(billRecordUrl))),
          _bottomItem(context, '修改密码', () => routerDelegate.push(const ModifyPasswordPage())),
          _bottomItem(context, '客服电话',() => launchUrl(Uri.parse('tel:400-6205-566')),right: commonText('400-6205-566',color: MyColor.mainColor,size: 12)),
          _bottomItem(context, '当前版本',(){},right: commonText(ref.watch(versionProvider),color: MyColor.blackColor(context),size: 12)),
          _bottomItem(context, '设置',() => routerDelegate.push(WebViewPage(settingUrl))),
          _bottomItem(context, '账号管理',() => routerDelegate.push(const AccountManagementPage())),
          SizeFit.sizedBoxH20,
          Center(child: LargeButton(title: '退出登录',
              onPressed: (){
              MyActionAlert.showAlert(context, '退出登录', '您确定要退出登录吗?', (){}, () {
                ref.read(homeIndexProvider.notifier).state = 0;
                ref.read(loginInfoNotifierProvider.notifier).loginOut();
              },leftTitle: '取消',rightTitle: '确定');
          }
          ))
        ],
      )
    );
  }
  
  Widget _bottomItem(BuildContext context, String text, VoidCallback onTab,{
    Widget right = const Icon(Icons.arrow_forward_ios,size: 14,)}){
    return GestureDetector(
      onTap: onTab,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
        child: Column(
          children: [
            Row(children: [
              commonText(text,color: MyColor.blackColor(context)),
              const Spacer(),
              right
            ],),
            SizeFit.sizedBoxH10,
            const Divider()
          ],
        ),
      ),
    );
  }

  ///获取版本号
  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version; //版本号
    return version;
  }
}
