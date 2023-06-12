import 'package:leshua/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/main.dart';
import 'package:leshua/pages/sn/sn_detail.dart';
import 'package:leshua/style/app_image.dart';
import 'package:leshua/style/app_size.dart';

import '../../model/sn_entity.dart';

class SnListPage extends StatelessWidget {
  List<SnEntity> list;
  SnListPage(this.list,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(context, '终端管理'),
      body: Container(
        color: Colors.grey[100],
        child: ListView.builder(
            itemBuilder: (context,index){
              return _item(context,index);
            },
          itemCount: list.length,
        ),
      ),
    );
  }

  Widget _item(BuildContext context,int index){
    return GestureDetector(
      onTap: () => routerDelegate.push(SnDetailPage(list[index])),
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const SizedBox(width:10,height:10,child: CircleAvatar(backgroundColor: Colors.orangeAccent)),
                    const SizedBox(width: 10,),
                    commonText('${list[index].merName}',size: 16)
                  ],
                ),
                SizeFit.sizedBoxH20,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(MyImage.iconBindDate,width: 15,height: 15,),
                            SizeFit.sizedBoxW10,
                            commonText('绑定时间:${list[index].bindMercTime}',color: MyColor.grayColor(context))
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Image.asset(MyImage.iconBindSn,width: 15,height: 15,),
                            SizeFit.sizedBoxW10,
                            commonText('${list[index].termSerialNo}',color: MyColor.grayColor(context))
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios,color: MyColor.mainColor,size: 14,)
                  ],
                ),
                SizeFit.sizedBoxH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText('终端类型:${list[index].termType == 'esign' ? '电签' : '传统'}',color: MyColor.grayColor(context)),
                    commonText('型号:${list[index].modelNo}',color: MyColor.grayColor(context)),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
