import 'package:leshua/utils/sp_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leshua/component/toast_show.dart';
import 'package:leshua/config/sp_config.dart';
import 'package:leshua/model/common_bean_entity.dart';
import 'package:leshua/model/login_info_entity.dart';
import 'package:leshua/pages/login/login.dart';

import '../config/http_config.dart';
import '../http/dio_util.dart';
import '../main.dart';

final StateNotifierProvider<LoginInfo,LoginInfoEntity> loginInfoNotifierProvider =
    StateNotifierProvider<LoginInfo,LoginInfoEntity>((ref) => LoginInfo());

class LoginInfo extends StateNotifier<LoginInfoEntity> {
  LoginInfo() : super(LoginInfoEntity());

  /// 登录
  Future loginWithPassword(String phone,String password) async{
    var params = {
      'phoneNo': phone,
      'password': password
    };
    CommonBeanEntity? commonEntity =  await DioUtil.getInstance()?.post(HttpConfig.loginWithPassword,params: params);
    if(commonEntity?.code == 200){
      _loginSuccess(commonEntity!);
    }else{
      MyToast.showToast(commonEntity?.message ?? '登录失败');
    }
  }

  /// 验证码登录
  Future loginWithCode(String phone,String code) async{
    var params = {
      'phoneNo': phone,
      'code': code
    };
    CommonBeanEntity? commonEntity =  await DioUtil.getInstance()?.post(HttpConfig.loginWithCode,params: params);
    if(commonEntity?.code == 200){
      _loginSuccess(commonEntity!);
    }else{
      MyToast.showToast(commonEntity?.message ?? '登录失败');
    }
  }

  /// 登录成功
  void _loginSuccess(CommonBeanEntity entity){
    state = LoginInfoEntity.fromJson(entity.data);
    SpUtil().setString(spToken, state.token ?? '');
    SpUtil().setString(spUsername, state.user?.username ?? '');
    SpUtil().setBool(spIsLogin, true);
    SpUtil().setString(spPassword, '');
    SpUtil().setString(spCode, '');
    MyToast.showToast('登录成功');
    routerDelegate.clearAll(const MyHomePage());
  }

  /// 退出登录
  void loginOut() async {
    state = LoginInfoEntity();
    SpUtil().setString(spToken,'');
    SpUtil().setBool(spIsLogin, false);
    routerDelegate.clearAll(const LoginPage());
  }
}