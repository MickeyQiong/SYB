
import 'package:leshua/style/app_style.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leshua/component/action_alert.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/config/http_config.dart';
import 'package:leshua/http/dio_util.dart';
import 'package:leshua/main.dart';
import 'package:leshua/style/app_color.dart';
import 'package:leshua/model/sn_entity.dart';
import 'package:leshua/pages/sn/bind_sn.dart';
import 'package:leshua/pages/sn/sn_list.dart';
import 'package:leshua/pages/webview/webview1.dart';
import 'package:leshua/pages/webview/webview_config.dart';
import 'package:leshua/riverpod/merchant_riverpod.dart';
import 'package:leshua/style/app_image.dart';
import 'package:leshua/style/app_size.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ref.read(merchantDetailProvider.notifier).getMerchantDetail();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              _top(context,ref),
              // SizeFit.sizedBoxH10,
              // _notice(context),
              SizeFit.sizedBoxH10,
              _menu(context,ref),
              const Divider(thickness: 10,color: MyColor.lightBackgroundColor,),
              _swiper(context)
        ],
      ),
    ));
  }

  /// 顶部 当日交易额
  Widget _top(BuildContext context, WidgetRef ref){
    return GestureDetector(
      onTap: () => routerDelegate.push(WebViewPage(tradeRecordUrl)),
      child: Container(
        color: MyColor.backColor(context),
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset(MyImage.bgHomeTop).image,
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10),),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(MyImage.iconHomeTop, width: 20, height: 20,),
                      SizeFit.sizedBoxW10,
                      commonText('当日交易金额（元）',color: Colors.white),
                    ],
                  ),
                  SizeFit.sizedBoxH20,
                  Row(
                    children: [
                      SizeFit.sizedBoxH20,
                      commonText('${ref.watch(todayTotalAmount)}',color: Colors.white,
                          size: 24,weight: FontWeight.bold
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
                right: 10,
                child: Image.asset(MyImage.iconHomeTopRight,width: 80,height: 80,)
            )
          ],
        ),
      ),
    );
  }

  /// 消息通知布局
  Widget _notice(BuildContext context){
    return Container(
      color: MyColor.backColor(context),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Image.asset(MyImage.iconHomeNotice, width: 20, height: 20,),
          SizeFit.sizedBoxW10,
          commonText('关于2023年春节放假期间的结算通知',color: MyColor.grayColor(context))
        ],
      ),
    );
  }

  final menuData = [
    //{'icon': MyImage.iconHomeMenu1, 'text': '商户管理'},
    {'icon': MyImage.iconHomeMenu2, 'text': '设备管理'},
    //{'icon': MyImage.iconHomeMenu3, 'text': '银行卡管理'},
    {'icon': MyImage.iconHomeMenu4, 'text': '设备交易记录'},
  ];

  /// 主菜单部分
  Widget _menu(BuildContext context,WidgetRef ref){
    return Container(
      color: MyColor.backColor(context),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return _menuItem(index == 0 ? 1 : 3,menuData[index]['icon']!, menuData[index]['text']!,context,ref);
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
          ),
          // SizeFit.sizedBoxH20,
          // Row(
          //   children: [
          //     _menuItem1('收款码', '快速扫码,便捷收款', const Color(0xFF0079AD),
          //           MyImage.homeBottomBg1, MyImage.iconHomeBottom1,
          //             (){EasyLoading.showToast('该功能正在开发中，敬请期待！');}),
          //     SizeFit.sizedBoxW20,
          //     _menuItem1('查看限额', '查看我的收款额度', const Color(0xFFC26406),
          //         MyImage.homeBottomBg2, MyImage.iconHomeBottom2,
          //             () => routerDelegate.push(WebViewPage(normUrl))),
          //   ],
          // )
        ],
      ),
    );
  }

  /// 收款码 和 查看限额 item
  Widget _menuItem1(String title,String subTitle,Color textColor,String bgImage,
      String iconPath,VoidCallback onTap){
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: Image.asset(bgImage).image,
              fit: BoxFit.fill
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconPath,width: 50,height: 50,),
              const SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonText(title,color: textColor),
                  commonText(subTitle,color: textColor,size: 10,maxLines: 2)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 主菜单按钮item
  Widget _menuItem(int index,String iconPath, String title,BuildContext context,WidgetRef ref) {
    return GestureDetector(
      onTap: (){
        if(index == 0){
          routerDelegate.push(WebViewPage(url));
        }else if(index == 1){
          var merchantDetail = ref.watch(merchantDetailProvider);
          String? auditStatus = '';
          if(merchantDetail.merchantInfo?.isNotEmpty ?? false) {
            auditStatus = merchantDetail.merchantInfo?[0].merInfoBaseTempVO
                ?.auditStatus;
          }
          if(merchantDetail.merchantInfo?.isEmpty ?? true){
            // 如果商户列表为空,弹窗提示去商户管理页面
            MyActionAlert.showAlert(context, '商户开通', '您的账号还未完成商户开通,请先去商户管理开通',null,
                    (){},rightTitle: '知道了'
            );
          }else{
            if(auditStatus == 'pending'){
              // 如果是审核中,弹窗提示
              MyActionAlert.showAlert(context, '商户开通', '商户开通正在进行中,请开通后使用',null,
                      (){},rightTitle: '知道了'
              );
            }else if(auditStatus == 'reject'){
              // 商户进件被拒
              MyActionAlert.showAlert(context, '商户开通', '您的商户开通审核失败,请修改资料完成开通',
                  (){}, () => routerDelegate.push(WebViewPage(url)),
                  leftTitle:'暂不开通',rightTitle: '知道了'
              );
            }else if(auditStatus == 'agree'){
              // 进件成功,展示终端状态
              DioUtil.getInstance()?.dio.post(HttpConfig.snList,queryParameters: {'merCode': merchantDetail.merchantInfo?[0].merCode ?? ''})
                .then((value){
                  List<SnEntity> snList = [];
                  Response response = value;
                  var listDynamic = response.data as List;
                  if(listDynamic.isNotEmpty){
                    for (var element in listDynamic) {
                      snList.add(SnEntity.fromJson(element));
                    }
                  }
                  if(snList.isEmpty){
                    // 如果终端列表是空,就去绑定页面
                    routerDelegate.push(BindSnPage(merchantDetail.merchantInfo?[0].merCode ?? ''));
                  }else{
                    routerDelegate.push(SnListPage(snList));
                  }
              });
            }
          }
        }else if(index == 2){
          routerDelegate.push(WebViewPage(bankCardUrl));
        } else if(index == 3){
          routerDelegate.push(WebViewPage(tradeRecordUrl));
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath,width: 40,height: 40,),
          SizeFit.sizedBoxH10,
          commonText(title,color: MyColor.blackColor(context)),
        ],
      ),
    );
  }

  /// 此方法可以直接跳到微信,但有点问题
  launchURL () async {
    const url = 'weixin://dl/business/?ticket=tdfd2ba5686833d7ecdee6e11c86f7f64';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  /// 测试数据
  final testSwiperData = [Colors.orangeAccent,Colors.redAccent,Colors.pinkAccent];
  final testSwiperData1 = [Colors.orangeAccent];

  /// 轮播图
  Widget _swiper(BuildContext context) {
    return Container(
          color: MyColor.backColor(context),
          height: 150,
          child: Swiper(
            itemBuilder: (c, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset(MyImage.homeBanner).image,
                    fit: BoxFit.fill
                  ),
                    borderRadius: BorderRadius.circular(10)
                ),
                margin: const EdgeInsets.all(16),
              );
            },
            itemCount: testSwiperData1.length,
            itemHeight: 100,
            itemWidth: 300,
            autoplay: testSwiperData1.length != 1,

            /// 用户拖拽的时候，是否停止自动播放
            autoplayDisableOnInteraction: true,

            ///控制指示器位于分页下面还是页面内
            outer: false,
            fade: 0.8,

            ///两侧之间的距离，值越小，越靠近
            viewportFraction: 1,

            ///两侧缩放比例
            scale: 0.8,
          ),
    );
  }
}
