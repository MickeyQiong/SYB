import 'dart:async';

import 'package:leshua/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:leshua/component/common_widget.dart';

class AuthCodeButton extends StatefulWidget {

  final int timeCount;
  late VoidCallback onPressed;
  final VoidCallback? endAction;


  AuthCodeButton({
    Key? key,
    required this.onPressed,
    this.timeCount = 60,
    this.endAction,
  }):super(key: key);

  @override
  AuthCodeButtonState createState() => AuthCodeButtonState();
}

class AuthCodeButtonState extends State<AuthCodeButton> {

  String title = '点击获取';
  bool isDisable = true;

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisable ? widget.onPressed : null,
      child: Container(
        width: 120.px,
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isDisable ? MyColor.mainColor : MyColor.color_e8f3f0
        ),
        child: Center(
          child: commonText(title,color: isDisable ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  void startAction() {
    int counter = widget.timeCount;
    setState(() {
      title = '${counter}s';
      isDisable = false;
    });

    if (_timer != null) {
      return;
    }

    // 开始倒计时
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      counter--;
      if (counter <= 0) {
        if (widget.endAction != null) {
          widget.endAction!();
        }
        setState(() {
          title = '重新获取';
          isDisable = true;
        });
        _timer?.cancel();
        _timer = null;
      } else {
        setState(() {
          title = '${counter}s';
        });
      }
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    super.dispose();
  }
}