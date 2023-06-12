import 'package:leshua/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/component/large_button.dart';
import 'package:leshua/pages/login/register_set_password.dart';

import '../../component/code_button.dart';
import '../../component/toast_show.dart';
import '../../config/http_config.dart';
import '../../http/dio_util.dart';
import '../../main.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final GlobalKey<AuthCodeButtonState> authCodeKey = GlobalKey();
  late TextEditingController _phoneController;
  late TextEditingController _codeController;

  @override
  initState(){
    super.initState();
    _phoneController = TextEditingController();
    _codeController = TextEditingController();
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
      appBar: commonAppbar(context, '忘记密码'),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: MyColor.backColor(context),
        child: Column(
          children: [
            _code(context),
            const SizedBox(height: 50,),
            LargeButton(title: '去改密码', onPressed: (){
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
              DioUtil.getInstance()?.post(HttpConfig.checkResetPassword,params: params).then((value){
                // 校验验证码成功
                if(value?.code != null && value?.code == 200){
                  routerDelegate.push(RegisterSetPasswordPage(false,_phoneController.value.text,value?.data));
                }
              });
              //routerDelegate.push(const RegisterSetPasswordPage());
              }
            )
          ],
        ),
      ),
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
              DioUtil.getInstance()?.post(HttpConfig.sendResetPasswordCode,
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
