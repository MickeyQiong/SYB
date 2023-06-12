import 'package:leshua/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/component/large_button.dart';
import 'package:leshua/main.dart';
import 'package:leshua/pages/login/login.dart';
import 'package:leshua/riverpod/login_riverpod.dart';
import 'package:leshua/style/app_image.dart';

class SetPasswordSuccessPage extends StatelessWidget {
  const SetPasswordSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(context, '设置密码'),
      body: Container(
        width: double.infinity,
        color: MyColor.backColor(context),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Image.asset(MyImage.iconDone,width: 60,height: 60,),
            const SizedBox(height: 10,),
            commonText('设置成功',color: MyColor.mainColor),
            const SizedBox(height: 80,),
            Consumer(builder: (context,ref,child) =>
                LargeButton(title: '去登录', onPressed: (){
                  ref.read(loginInfoNotifierProvider.notifier).loginOut();
                }),
            )
          ],
        ),
      ),
    );
  }
}
