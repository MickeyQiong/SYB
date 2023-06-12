import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:leshua/style/app_color.dart';
import 'package:leshua/style/app_size.dart';
import 'package:leshua/utils/sp_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:images_picker/images_picker.dart';
import 'package:leshua/api/api.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/component/large_button.dart';
import 'package:leshua/config/http_config.dart';
import 'package:leshua/config/sp_config.dart';
import 'package:leshua/http/dio_util.dart';
import 'package:leshua/main.dart';
import 'package:leshua/model/check_sn_bind_entity.dart';
import 'package:leshua/pages/sn/scan_page.dart';
import 'package:leshua/pages/webview/webview.dart';
import 'package:leshua/style/app_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../model/common_bean_entity.dart';

class BindSnPage extends StatefulWidget {
  String merCode;
  BindSnPage(this.merCode,{Key? key}) : super(key: key);

  @override
  State<BindSnPage> createState() => _BindSnPageState();
}

class _BindSnPageState extends State<BindSnPage> {
  late TextEditingController _controller;
  final _globalKey = GlobalKey();
  var showBtn = true;

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();
    _controller.text = SpUtil().getString(spSn) ?? '';
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(context, '绑定终端'),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Stack(
              alignment: const Alignment(1,0),
                children: [
                  myInputField(context, _controller, '终端号', '请输入终端号', false),
                  InkWell(
                    onTap: (){
                      routerDelegate.push(ScanPage()).then((value) => _controller.text = value);
                    },
                    child: Image.asset(MyImage.iconScan,width: 30,height: 30,)
                  )
                ]
            ),
            const SizedBox(height: 80,),
            LargeButton(title: '终端绑定', onPressed: () {
              SpUtil().setString(spSn, _controller.text);
              check();
            })
          ],
        ),
      ),
    );
  }

  /// 检测是否要意愿核身
  void check(){
    DioUtil.getInstance()?.post(
        HttpConfig.check, params: {'termNo': _controller.text})
        .then((value) {
      if (value?.code != null && value?.code == 200) {
        CheckSnBindEntity entity = CheckSnBindEntity.fromJson(
            value?.data);
        if (entity.needCheck!) {
          // 需要意愿核身，但是先检测核身状态，如果通过就直接绑定
          // 否则再弹二维码
          checkResult(entity.checkUrl!);
        }else{
          snBind();
        }
      }
    });
  }

  Future _save(BuildContext context) async {
    await getPermission(Permission.storage);
    try {
      RenderRepaintBoundary? boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;

      var image = await boundary!.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      var directory = await getTemporaryDirectory();
      var file =
      await File('${directory.path}/${DateTime.now().toString()}.png')
          .create();
      await file.writeAsBytes(pngBytes);
      ImagesPicker.saveImageToAlbum(file).then((value) {
        EasyLoading.showToast(value ? '保存成功' : '保存失败');
        showBtn = true;
        setState(() {});
        Navigator.pop(context);
      });
    } catch (e) {
      EasyLoading.showToast('保存失败');
    }
  }

  Future getPermission(Permission permission) async {
    var storagePermission = await permission.status;
    //debugPrint(storagePermission.toString());
    if (storagePermission.isDenied || storagePermission.isRestricted) {
      Map<Permission, PermissionStatus> statuses = await [permission].request();
      debugPrint('权限状态： ${statuses.toString()}');
    }
  }

  /// 检测核身结果
  void checkResult(String url){
    DioUtil.getInstance()?.dio.post(HttpConfig.check1,queryParameters: {'termNo': _controller.text})
    //DioUtil.getInstance()?.post(HttpConfig.check1,params: {'termNo': _controller.text})
        .then((value){
      Response response = value;
      var entity = CommonBeanEntity.fromJson(response.data);
      if(entity.code == 200){
        snBind();
      }else{
        showDialog(context: context, builder: (context){
          return Center(
            child: RepaintBoundary(
              key: _globalKey,
              child: Container(
                width: SizeFit.screenWidth - 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    commonText('需要扫码完成意愿核身'),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: QrImage(
                        data: url,
                        errorCorrectionLevel: QrErrorCorrectLevel.M,
                        version: QrVersions.auto,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText('操作说明',color: Colors.orange),
                        commonText('1、保存二维码'),
                        commonText('2、打开【微信-扫一扫】'),
                        commonText('3、扫描二维码完成意愿核身'),
                      ],
                    ),
                    showBtn ? Column(
                      children: [
                        const SizedBox(height: 20,),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: MyColor.mainColor)
                            ),
                            onPressed: (){
                              showBtn = false;
                              setState((){});
                              ///延时操作，实现保存隐藏按钮图片
                              Future.delayed(const Duration(seconds: 1)).then((value) {
                                _save(context);
                              });
                            },
                            child: commonText('保存二维码',color: MyColor.mainColor)
                        ),
                      ],
                    ) : const SizedBox(),
                  ],
                ),
              ),
            ),
          );
        });
      }
    });
  }

  /// 终端绑定
  void snBind(){
    var params = {
      'merCode': widget.merCode,
      'termNo' : _controller.text
    };
    DioUtil.getInstance()?.post(HttpConfig.snBind,params: params)
      .then((value){
        if(value?.code == 200){
          // 绑定成功,去列表页面
          EasyLoading.showToast('绑定成功');
          routerDelegate.popRoute();
        }else{
          EasyLoading.showToast('绑定失败');
        }
    });
  }
}
