
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leshua/api/api.dart';
import 'package:leshua/config/http_config.dart';
import 'package:leshua/http/dio_util.dart';
import 'package:leshua/http/list_view_notifier.dart';
import 'package:leshua/http/view_state.dart';
import 'package:leshua/model/login_info_entity.dart';
import 'package:leshua/model/policy_model_entity.dart';

import '../model/common_bean_entity.dart';

// final loginProvider = FutureProvider.family<LoginInfoData,String>((ref,params) async {
//   var commonEntity =  DioUtil.getInstance()?.post(HttpConfig.loginPath,params: params);
//   var loginInfo = await commonEntity;
//   return LoginInfoData.fromJson(loginInfo?.data);
// });
//
// final lProvider = FutureProvider.family<CommonBeanEntity?,String>((ref,params) async {
//   return DioUtil.getInstance()?.post(HttpConfig.loginPath,params: params);
// });

final policyListProvider = StateNotifierProvider<
    ListViewStateNotifier<PolicyModelList>,
    ListViewState<List<PolicyModelList>>>((ref){
      return ListViewStateNotifier<PolicyModelList>(
          pageIndex: 1,
          pageSize: 15,
          fetchItems: (int pageIndex,int pageSize){
              return getPolicyList(pageIndex: pageIndex, pageSize: pageSize);
          });
});
