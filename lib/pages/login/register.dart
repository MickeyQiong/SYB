import 'dart:convert';

import 'package:leshua/style/app_style.dart';
import 'package:leshua/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/component/toast_show.dart';
import 'package:leshua/config/http_config.dart';
import 'package:leshua/http/dio_util.dart';
import 'package:leshua/pages/login/register_set_password.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../component/code_button.dart';
import '../../component/large_button.dart';
import '../../config/sp_config.dart';
import '../../main.dart';
import '../../style/app_image.dart';
import '../webview/webview1.dart';
import '../webview/webview_config.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<AuthCodeButtonState> authCodeKey = GlobalKey();
  late TextEditingController _phoneController;
  late TextEditingController _codeController;
  bool _agreement = false;

  @override
  initState(){
    super.initState();
    _phoneController = TextEditingController();
    _codeController = TextEditingController();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    _phoneController.text = SpUtil().getString(spPhone) ?? '';
    _codeController.text = SpUtil().getString(spCode) ?? '';
  }

  @override
  void dispose(){
    _codeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: commonAppbar(context, '注册'),
        body: Container(
            color: MyColor.backColor(context),
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('您好，', style: TextStyle(fontSize: 20.px),),
                  const SizedBox(height: 10,),
                  Text('欢迎注册收易贝管家!',
                    style:
                      TextStyle(fontSize: 16.px, color: MyColor.font66(context)),
                  ),
                  const SizedBox(height: 30,),
                  _code(context),
                  const SizedBox(height: 20,),
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
                          SpUtil().setString(spCode, _codeController.text);
                          routerDelegate.push(WebViewPage(userAgreementUrl));
                          },
                        child: commonText('《用户协议》',color: Colors.blue),
                      ),
                      commonText('和'),
                      InkWell(
                        onTap: () {
                          SpUtil().setString(spPhone, _phoneController.text);
                          SpUtil().setString(spCode, _codeController.text);
                          routerDelegate.push(WebViewPage(rivacyAgreementUrl));
                          },
                        child: commonText('《隐私协议》',color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: LargeButton(title: '注册', onPressed: (){
                      if(!_agreement){
                        showToast(context, '请先同意用户协议和隐私协议');
                        return;
                      }
                      if (_phoneController.value.text.isEmpty ||
                        _phoneController.value.text.length != 11) {
                        showToast(context, '请输入正确的手机号');
                        return;
                      }
                      if (_codeController.value.text.isEmpty) {
                        showToast(context, '请输入验证码');
                        return;
                      }

                      var params = {
                        'phoneNo':_phoneController.value.text,
                        'code': _codeController.value.text
                      };
                      DioUtil.getInstance()?.post(HttpConfig.checkRegisterCode,params: params).then((value){
                        // 校验验证码成功
                        if(value?.code != null && value?.code == 200){
                           routerDelegate.push(RegisterSetPasswordPage(true,_phoneController.value.text,value?.data));
                        }
                      });
                    }),
                  )
                  ]
           )
        )
    );
  }

  /// 验证码
  Widget _code(BuildContext context){
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
              DioUtil.getInstance()?.post(HttpConfig.sendRegisterCode,
                  params: {'phoneNo':_phoneController.value.text}).then((value) => MyToast.showToast(value?.message ?? '发送失败'));
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
