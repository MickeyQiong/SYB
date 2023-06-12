import 'dart:async';

import 'package:leshua/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:leshua/component/large_button.dart';
import 'package:leshua/config/sp_config.dart';
import 'package:leshua/main.dart';
import 'package:leshua/pages/login/login.dart';
import 'package:leshua/style/app_image.dart';

class LaunchPage extends StatefulWidget {
  static const String routerName = "launch";

  const LaunchPage({Key? key}) : super(key: key);

  @override
  LaunchPageState createState() => LaunchPageState();
}

class LaunchPageState extends State<LaunchPage> {
  bool hadInit = false;
  int currentTime = 3;
  late Timer _timer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (hadInit) return;
    hadInit = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState((){
        currentTime--;
        if(currentTime == 0){
          checkState();
        }
      });
    });
  }

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(MyImage.launchImage,width: double.infinity,fit: BoxFit.fill,),
            SafeArea(
              left: true,
              minimum: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10), right: Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('跳过 $currentTime',
                      style: const TextStyle(fontSize: 14, color: Colors.blue)),
                ),
                onTap: () {
                  checkState();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 检查登录状态
  void checkState(){
    // if(!SpUtil().getBool(spNotFirstUse)){
    //   // 第一次打开
    //   routerDelegate.replace(const WelcomePage());
    // }else {
      if (SpUtil().getBool(spIsLogin)) {
        // 已经登录过
        routerDelegate.replace(const MyHomePage());
      } else {
        // 未登录
        routerDelegate.replace(const LoginPage());
      }
    // }
  }
}

/// 引导页
class WelcomePage extends StatefulWidget {
  
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(
          onPageChanged: (index){
            setState((){
              curIndex = index;
            });
          },
          children: const [
            Placeholder(),
            Placeholder(),
            Placeholder(),
          ],
        ),
        SafeArea(
          child: Offstage(
            offstage: curIndex != 2,
            child: LargeButton(title: '开始使用', onPressed: (){
              SpUtil().setBool(spNotFirstUse, true);
              routerDelegate.replace(const LoginPage());
            }),
          ),
        )
      ]
    );
  }
}

