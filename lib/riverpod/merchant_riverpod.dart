import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leshua/model/merchant_detail_entity.dart';
import 'package:leshua/model/merchant_entity.dart';

import '../config/http_config.dart';
import '../http/dio_util.dart';
import '../model/common_bean_entity.dart';

final StateNotifierProvider<MerchantInfo,List<MerchantEntity>> merchantProvider =
    StateNotifierProvider((ref) => MerchantInfo(ref));

class MerchantInfo extends StateNotifier<List<MerchantEntity>> {
  StateNotifierProviderRef<MerchantInfo, List<MerchantEntity>> ref;
  MerchantInfo(this.ref) : super([]){
    getMerchant();
  }

  Future getMerchant() async {
    var merchantList = <MerchantEntity>[];
    Response? response = await DioUtil.getInstance()?.dio.post(HttpConfig.getMerchant);
    var list = response?.data as List;
    for (var element in list) {
      merchantList.add(MerchantEntity.fromJson(element));
    }
    state = merchantList;
    getTotal();
  }

  /// 获取当日交易金额
  void getTotal() async {
    var merCode = '';
    if(state.isNotEmpty){
      merCode = state[0].merCode ?? '';
    }
    Response? response = await DioUtil.getInstance()?.dio.
      post(HttpConfig.totalAmount,queryParameters:{'merCode': merCode});
    //ref.read(totalAmount.notifier).state = response?.data;
    ref.read(todayTotalAmount.notifier).state = response?.data;
  }
}

final StateNotifierProvider<MerchantDetailInfo,MerchantDetailEntity> merchantDetailProvider =
StateNotifierProvider((ref) => MerchantDetailInfo(ref));

class MerchantDetailInfo extends StateNotifier<MerchantDetailEntity>{
  var merCode = '';
  StateNotifierProviderRef<MerchantDetailInfo,MerchantDetailEntity> ref;
  MerchantDetailInfo(this.ref) : super(MerchantDetailEntity());

  Future getMerchantDetail() async {
        Response response =  await DioUtil.getInstance()?.dio.post(HttpConfig.getMerchantDetail);
        MerchantDetailEntity entity = MerchantDetailEntity.fromJson(response.data);
        if(entity.merchantInfo?.isNotEmpty ?? false){
          merCode = entity.merchantInfo?[0].merCode ?? '';
        }
        state = entity;
        getTotal(merCode);

  }

  /// 获取当日交易金额
  void getTotal(String merCode) async {
    Response? response = await DioUtil.getInstance()?.dio.
    post(HttpConfig.totalAmount,queryParameters:{'merCode': merCode});
    ref.read(todayTotalAmount.notifier).state = response?.data;
  }
}

final StateProvider<double> totalAmount = StateProvider((ref) => 0.0);

/// 当日交易金额
final StateNotifierProvider<TotalInfo,double> todayTotalAmount =
    StateNotifierProvider((ref) => TotalInfo(0.0,ref));

class TotalInfo extends StateNotifier<double> {
  final StateNotifierProviderRef<TotalInfo, double> ref;
  TotalInfo(super.state, this.ref);

  Future getTodayTotal() async {
    var merchantList = ref.watch(merchantDetailProvider);
    var merCode = '';
    if(merchantList.merchantInfo?.isNotEmpty ?? false){
      merCode = merchantList.merchantInfo?[0].merCode ?? '';
    }
    Response? response = await DioUtil.getInstance()?.dio.
      post(HttpConfig.totalAmount,queryParameters:{'merCode': merCode});
    state = response?.data;
  }
}