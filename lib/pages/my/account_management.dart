
import 'package:leshua/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/component/large_button.dart';
import 'package:leshua/style/app_image.dart';

import '../../component/action_alert.dart';
import '../../config/http_config.dart';
import '../../config/sp_config.dart';
import '../../http/dio_util.dart';
import '../../main.dart';
import '../../riverpod/login_riverpod.dart';
import '../../riverpod/merchant_riverpod.dart';
import '../../style/app_size.dart';

class AccountManagementPage extends ConsumerWidget {
  const AccountManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(context, '账号管理'),
      body: _body(context)
    );
  }

  Widget _body(BuildContext context){
    return Consumer(
      builder: (context,ref,child) =>  Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Image.asset(MyImage.imageNotice,width: 100,height: 100,),
            const SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText('注销后将无法登录此账号，并将失去此账号下的所有历史数据。',maxLines: 3),
                const SizedBox(height: 20,),
                commonText('如您的账户在90天内有交易，将暂时无法注销。',maxLines: 3),
              ],
            ),
            const SizedBox(height: 50,),
            LargeButton(title: '注销账号', onPressed: (){
              var provider = ref.watch(merchantDetailProvider);
              // 如果商户信息是空 或者 90天内无交易
              if((provider.merchantInfo?.isEmpty ?? true) || (provider.canRegister ?? true)){
                MyActionAlert.showAlert(context, '温馨提示', '您确定要注销该账号吗?', (){}, () {
                  DioUtil.getInstance()?.post(HttpConfig.cancelUser,
                      params: {'userName':SpUtil().getString(spUsername)}).then((value){
                    if(value?.code == 200){
                      EasyLoading.showToast(value?.message ?? '注销成功');
                      ref.read(homeIndexProvider.notifier).state = 0;
                      ref.read(loginInfoNotifierProvider.notifier).loginOut();
                    }
                  });
                }, leftTitle:'我再想想',rightTitle: '狠心注销'
                );
              }else{
                  MyActionAlert.showAlert(context, '温馨提示', '该账号下90天内有交易行为,暂时无法注销!',
                      null, (){},rightTitle: '知道了');
              }
            })
          ],
        ),
      ),
    );
  }
}
