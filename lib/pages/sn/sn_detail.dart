import 'package:flutter/material.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/model/sn_entity.dart';

class SnDetailPage extends StatelessWidget {
  SnEntity entity;
  SnDetailPage(this.entity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bindState = '';
    if(entity.bindStatus == 'init'){
      bindState = '未绑定';
    }else if(entity.bindStatus == 'unbinded'){
      bindState = '已解绑';
    }else{
      bindState = '已绑定';
    }
    return Scaffold(
      appBar: commonAppbar(context, '终端详情'),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            commonText('商户名称:${entity.merName}'),
            const SizedBox(height: 10,),
            commonText('TUSN号:${entity.termCode}'),
            const SizedBox(height: 10,),
            commonText('绑定时间:${entity.bindMercTime}'),
            const SizedBox(height: 10,),
            commonText('终端类型:${entity.termType == 'esign' ? '电签' : '传统'}'),
            const SizedBox(height: 10,),
            commonText('型号:${entity.modelNo}'),
            const SizedBox(height: 10,),
            commonText('品牌名称:${entity.productName ?? ''}'),
            const SizedBox(height: 10,),
            commonText('激活状态:$bindState'),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
