import 'package:leshua/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/component/large_button.dart';
import 'package:leshua/config/http_config.dart';
import 'package:leshua/http/dio_util.dart';
import 'package:leshua/pages/login/set_password_success.dart';
import 'package:leshua/style/app_size.dart';

import '../../component/toast_show.dart';
import '../../main.dart';

class ModifyPasswordPage extends StatefulWidget {
  const ModifyPasswordPage({Key? key}) : super(key: key);

  @override
  State<ModifyPasswordPage> createState() => _ModifyPasswordPageState();
}

class _ModifyPasswordPageState extends State<ModifyPasswordPage> {
  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState(){
    super.initState();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose(){
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(context, '修改密码'),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: MyColor.backColor(context),
        child: Column(
          children: [
            myInputField(context,_oldPasswordController, '旧密码', '请输入', true),
            SizeFit.sizedBoxH20,
            myInputField(context,_newPasswordController, '新密码', '请输入', true),
            SizeFit.sizedBoxH20,
            myInputField(context,_confirmPasswordController, '确认密码', '请输入', true),
            const SizedBox(height: 50,),
            LargeButton(title: '完成', onPressed: (){
              if(_oldPasswordController.value.text.isEmpty){
                showToast(context, '请输入旧密码');
                return;
              }
              if(_newPasswordController.value.text.isEmpty){
                showToast(context, '请输入新密码');
                return;
              }
              if(_newPasswordController.value.text != _confirmPasswordController.value.text){
                showToast(context, '两次输入的密码不一致');
                return;
              }
              var params = {
                'oldPassword': _oldPasswordController.value.text,
                'newPassword': _newPasswordController.value.text
              };
              DioUtil.getInstance()?.post(HttpConfig.updatePassword,params: params)
                .then((value) {
                if(value?.code != null && value?.code == 200){
                  MyToast.showToast('设置成功');
                  routerDelegate.clearAll(const SetPasswordSuccessPage());
                }
              });
            })
          ],
        ),
      ),
    );
  }
}
