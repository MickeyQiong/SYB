import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leshua/component/code_button.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/component/large_button.dart';
import 'package:leshua/config/http_config.dart';
import 'package:leshua/config/sp_config.dart';
import 'package:leshua/http/dio_util.dart';
import 'package:leshua/main.dart';
import 'package:leshua/pages/login/forget_password.dart';
import 'package:leshua/pages/login/register.dart';
import 'package:leshua/pages/webview/webview_config.dart';
import 'package:leshua/riverpod/login_riverpod.dart';
import 'package:leshua/style/app_image.dart';
import 'package:leshua/style/app_style.dart';

import '../../component/toast_show.dart';
import '../../utils/sp_util.dart';
import '../webview/webview1.dart';

final ChangeNotifierProvider<LoginButtonState> loginTextProvider =
ChangeNotifierProvider((ref) => LoginButtonState());

class LoginButtonState extends ChangeNotifier {
  String _text = '登录';
  bool _enable = true;

  String get text => _text;
  bool get enable => _enable;

  void loading() {
    _text = '登录中...';
    _enable = false;
    notifyListeners();
  }

  void loginSuccess() {
    _text = '登录';
    _enable = true;
    notifyListeners();
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final GlobalKey<AuthCodeButtonState> authCodeKey = GlobalKey();
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _codeController;
  bool _agreement = false;

  late TabController _tabController;
  var tabs = const [Tab(text: '密码登录',),Tab(text: '验证码登录',)];


  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: tabs.length,
        vsync: this
    );
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _codeController = TextEditingController();
    // Future.delayed(Duration.zero,(){
    //   if(!SpUtil().getBool(spNotFirstUse)){
    //     showDialog(context: context,barrierDismissible: false,
    //         useRootNavigator: false, builder: (context){
    //           return Center(
    //               child: _dialogContent(context)
    //           );
    //         });
    //   }
    // });
  }

  Widget _dialogContent(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[700],
        ),
        Container(
        width: SizeFit.screenWidth - 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizeFit.sizedBoxH20,
            commonText('服务协议和隐私政策',size: 18),
            SizeFit.sizedBoxH20,
            RichText(text: TextSpan(
              text: '感谢您使用收易贝管家App,为了更好的保护您的权益,请在使用前点击阅读',
              style: const TextStyle(fontSize: 14,color: Colors.black),
              children: [
                TextSpan(
                  text: '《用户协议》',
                  style: const TextStyle(fontSize: 14, color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      routerDelegate.push(WebViewPage(userAgreementUrl));
                    },
                ),
                const TextSpan(
                  text: '和',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                TextSpan(
                  text: '《隐私政策》',
                  style: const TextStyle(fontSize: 14, color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      routerDelegate.push(WebViewPage(rivacyAgreementUrl));
                    },
                ),
                const TextSpan(
                  text: '，确认同意后即可开启应用服务。使用过程中，我们将在根据具体功能需要获取某项手机权限时，'
                      '再次请您确认同意，并在条款说明的范围内手机、使用、共享并保护您的个人信息，如果您拒绝'
                      '开启权限，将不影响其他功能的使用。',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ]
            )),
            SizeFit.sizedBoxH20,
            LargeButton(title: '同意', onPressed: (){
              SpUtil().setBool(spNotFirstUse,true);
              setState((){});
            }),
            SizeFit.sizedBoxH10,
            GestureDetector(
              onTap: () => exit(0),
                child: commonText('不同意并退出APP',color: Colors.grey)
            )
          ],
        ),
      ),
    ]
    );
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    _phoneController.text = SpUtil().getString(spPhone) ?? '';
    _passwordController.text = SpUtil().getString(spPassword) ?? '';
    _codeController.text = SpUtil().getString(spCode) ?? '';
  }

  @override
  void dispose() {
    _tabController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpUtil().getBool(spNotFirstUse) ? Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const SizedBox(),
        iconTheme: IconThemeData(color: MyColor.iconColor(context)),
        backgroundColor: MyColor.backColor(context),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Theme.of(context).brightness),
      ),
      body:  _body(context),
    ): _dialogContent(context);
  }

  Widget _body(BuildContext context) {
    return  Container(
      color: MyColor.backColor(context),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '您好，',
            style: TextStyle(fontSize: 20.px),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '欢迎登录收易贝管家!',
            style: TextStyle(fontSize: 16.px, color: MyColor.font66(context)),
          ),
          const SizedBox(
            height: 30,
          ),
          TabBar(tabs: tabs,
            labelColor: MyColor.mainColor,
            indicatorColor: MyColor.mainColor,
            unselectedLabelColor: MyColor.color_1a1a1a,
            controller: _tabController,
          ),
          SizeFit.sizedBoxH20,
          Expanded(
            child: TabBarView(
              controller: _tabController, children: [loginWithPassword(),loginWithCode()]
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          _agreement = !_agreement;
                          setState((){});
                        },
                        child: Image.asset(_agreement ? MyImage.iconSelected : MyImage.iconUnSelected,width: 20,height: 20,)
                    ),
                    const SizedBox(width: 10,),
                    commonText('同意'),
                    InkWell(
                      onTap: () {
                        SpUtil().setString(spPhone, _phoneController.text);
                        SpUtil().setString(spPassword, _passwordController.text);
                        SpUtil().setString(spCode, _codeController.text);
                        routerDelegate.push(WebViewPage(userAgreementUrl));
                      },
                      child: commonText('《用户协议》',color: Colors.blue),
                    ),
                    commonText('和'),
                    InkWell(
                      onTap: () {
                        SpUtil().setString(spPhone, _phoneController.text);
                        SpUtil().setString(spPassword, _passwordController.text);
                        SpUtil().setString(spCode, _codeController.text);
                        routerDelegate.push(WebViewPage(rivacyAgreementUrl));
                      },
                      child: commonText('《隐私协议》',color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height:20,),
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final loginTextState = ref.watch(loginTextProvider);
                    //final loginInfoProvider = ref.watch(loginInfoNotifierProvider);
                    return LargeButton(
                        title: loginTextState.text,
                        enable: loginTextState.enable,
                        onPressed: () {
                          if(!_agreement){
                            showToast(context, '请先同意用户协议和隐私协议');
                            return;
                          }

                          var index = _tabController.index;
                          if (_phoneController.value.text.isEmpty ||
                              _phoneController.value.text.length != 11) {
                            showToast(context, '请输入正确的手机号');
                            return;
                          }
                          SpUtil().setString(spPhone, _phoneController.text);
                          if(index == 0) {
                            if (_passwordController.value.text.isEmpty) {
                              showToast(context, '请输入密码');
                              return;
                            }
                            ref.read(loginInfoNotifierProvider.notifier)
                                .loginWithPassword(_phoneController.value.text, _passwordController.value.text);
                          }else{
                            if (_codeController.value.text.isEmpty) {
                              showToast(context, '请输入验证码');
                              return;
                            }
                            ref.read(loginInfoNotifierProvider.notifier)
                              .loginWithCode(_phoneController.value.text, _codeController.value.text);
                          }
                        });
                  },
                ),
                SizeFit.sizedBoxH20,
                LargeOutlineButton('注册', () => routerDelegate.push(const RegisterPage()))
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 密码登录
  Widget loginWithPassword() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        myInputField(context,_phoneController, '您的手机号', '请输入手机号', false,),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(child: myInputField(context,_passwordController, '密码', '请输入密码', true,)),
            TextButton(onPressed: () => routerDelegate.push(const ForgetPasswordPage()),
                child: commonText('忘记密码',color: Colors.orange,size: 12))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // Row(
        //   children: [
        //     Checkbox(
        //         value: _remenberPassword,
        //         shape: const CircleBorder(),
        //         onChanged: (v) => setState(() {
        //           _remenberPassword = v!;
        //         })),
        //     Text(
        //       '记住账号',
        //       style: TextStyle(
        //           fontSize: 12.px, color: MyColor.font66(context)),
        //     )
        //   ],
        // )
      ],
    );
  }

  /// 验证码登录
  Widget loginWithCode(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        myInputField(context,_phoneController, '您的手机号', '请输入手机号', false),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(child: myInputField(context,_codeController, '验证码', '请输入验证码', true)),
            AuthCodeButton(
              key: authCodeKey, onPressed: (){
              if (_phoneController.value.text.isEmpty ||
                  _phoneController.value.text.length != 11) {
                showToast(context, '请输入正确的手机号');
                return;
              }
              authCodeKey.currentState?.startAction();
              DioUtil.getInstance()?.post(HttpConfig.sendLoginCode,params: {'phoneNo': _phoneController.value.text})
                .then((value) => MyToast.showToast(value?.message ?? '发送失败'));

              }
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
