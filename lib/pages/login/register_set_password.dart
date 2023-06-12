import 'package:leshua/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/component/toast_show.dart';
import 'package:leshua/config/http_config.dart';
import 'package:leshua/http/dio_util.dart';
import 'package:leshua/main.dart';
import 'package:leshua/pages/login/login.dart';

import '../../component/large_button.dart';

class RegisterSetPasswordPage extends StatefulWidget {
  final bool isRegister;
  final String phone;
  final String token;

  const RegisterSetPasswordPage(this.isRegister,this.phone,this.token,{Key? key}) : super(key: key);

  @override
  State<RegisterSetPasswordPage> createState() => _RegisterSetPasswordPageState();
}

class _RegisterSetPasswordPageState extends State<RegisterSetPasswordPage> {
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState(){
    super.initState();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose(){
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(context, '设置密码'),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: MyColor.backColor(context),
        child: Column(
          children: [
            myInputField(context,_newPasswordController, '设置密码', '请输入', true),
            SizeFit.sizedBoxH20,
            myInputField(context,_confirmPasswordController, '确认密码', '请输入', true),
            const SizedBox(height: 50,),
            LargeButton(title: '完成', onPressed: (){
              if(_newPasswordController.value.text.isEmpty){
                showToast(context, '请输入新密码');
                return;
              }
              if(_newPasswordController.value.text != _confirmPasswordController.value.text){
                showToast(context, '两次输入的密码不一致');
                return;
              }
              var params = {
                'phoneNo': widget.phone,
                'token': widget.token,
                'password': _newPasswordController.value.text
              };
              DioUtil.getInstance()?.post(widget.isRegister ? HttpConfig.register : HttpConfig.resetPassword,params: params,form: false).then((value){
                  if(value?.code != null && value?.code == 200){
                    MyToast.showToast(widget.isRegister ? '注册成功' : '设置成功');
                    routerDelegate.clearAll(const LoginPage());
                  }
              });
              //routerDelegate.push(const SetPasswordSuccessPage());
            })
          ],
        ),
      ),
    );
  }
}
