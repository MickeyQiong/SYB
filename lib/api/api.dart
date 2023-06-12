import 'dart:convert';

import 'package:leshua/config/http_config.dart';
import 'package:leshua/http/dio_util.dart';
import 'package:leshua/model/check_sn_bind_entity.dart';

import '../model/policy_model_entity.dart';

Future<List<PolicyModelList>> getPolicyList({required int pageIndex, required int pageSize}) async {
  // var policy = DioUtil.getInstance()?.post(HttpConfig.getPolicyList,
  //     params: jsonEncode({
  //       'pageNum': '$pageIndex',
  //       'pageSize': '$pageSize',
  //       'policyType': 'executed'
  //     }));
  // var policyModel = await policy;
  // return PolicyModelEntity.fromJson(policyModel?.data).list ?? [];
  var a = PolicyModelList.fromJson({'id':1,'policyName':'Aa'});
  var b = PolicyModelList.fromJson({'id':2,'policyName':'Bb'});
  var c = PolicyModelList.fromJson({'id':3,'policyName':'Cc'});
  List<PolicyModelList> list = [a,b,c];
  return list;
}

/// 检测sn的绑定状态
Future<CheckSnBindEntity>? checkSnBindState(String ternNo){
  DioUtil.getInstance()?.post(HttpConfig.check,params: {'termNo': ternNo})
      .then((value) {
    if(value?.code != null && value?.code == 200){
       return CheckSnBindEntity.fromJson(value?.data);
    }else{
      return CheckSnBindEntity();
    }
  });
  return Future(() => CheckSnBindEntity());
}
