
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:leshua/style/app_style.dart';

typedef VoidCallBack = void Function();


class MyActionAlert {
  /// 中间弹出弹窗
  static showCenter(BuildContext context, {
    required Widget child,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (ctx) {
        return GestureDetector(
          child: Container(
            color: Colors.black38,
            child: Center(child: child),
          ),
          onTap: () {
            if (barrierDismissible) {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            }
          },
        );
      },
    );
  }

  
  // 中间显示的取消/确认弹窗
  static showAlert(
    BuildContext context,
    String title,
    String message,
    VoidCallBack? leftPressed,
    VoidCallBack rightPressed, {
        String leftTitle = '取消',
        String rightTitle = '确定',
      }) {
    if (SizeFit.isIOS) {
      showCupertinoDialog(
        context: context, 
        builder: (ctx) {
          return _CupertinoAlert(
            context,title, message, leftTitle,rightTitle,leftPressed,rightPressed,
          );
        }
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return _MaterialAlert(
            context,title,message,leftTitle,rightTitle,leftPressed,rightPressed,
          );
        }
      );
    }
  }
}

class _CupertinoAlert extends StatelessWidget {

  final String title;
  final String message;
  final String leftTitle;
  final String rightTitle;
  final VoidCallBack? leftPressed;
  final VoidCallBack rightPressed;

  _CupertinoAlert(
    BuildContext context,
    this.title,
    this.message,
    this.leftTitle,
    this.rightTitle,
    this.leftPressed,
    this.rightPressed
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title, style: TextStyle(fontSize: 17.px, color: MyColor.color_1a1a1a, fontWeight: FontWeight.bold)),
      content: Container(
        padding: EdgeInsets.only(top: 8.px),
        child: Text(message, style: TextStyle(fontSize: 15.px, color: MyColor.color_333333)),
      ),
      actions: renderActions(context),
    );
  }

  List<Widget> renderActions(BuildContext context) {
    List<Widget> itemList = [];

    Widget leftItem = CupertinoDialogAction(
      textStyle: TextStyle(fontSize: 16.px, color: MyColor.color_999999),
      child: Text(leftTitle),
      onPressed: () {
        Navigator.of(context).pop();
        if (leftPressed != null) {
          leftPressed!();
        }
      },
    );
    if(leftPressed != null) {
      itemList.add(leftItem);
    }

    Widget item = CupertinoDialogAction(
        textStyle: TextStyle(fontSize: 16.px, color: MyColor.mainColor),
        child: Text(rightTitle),
        onPressed: () {
          Navigator.of(context).pop();
          rightPressed();
        });
    itemList.add(item);


    return itemList;
  }
}

class _MaterialAlert extends StatelessWidget {

  final String title;
  final String message;
  final String leftTitle;
  final String rightTitle;
  final VoidCallBack? leftPressed;
  final VoidCallBack rightPressed;

  _MaterialAlert(
    BuildContext context,
    this.title,
    this.message,
    this.leftTitle,
    this.rightTitle,
    this.leftPressed,
    this.rightPressed
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      titleTextStyle: TextStyle(fontSize: 17.px, color: MyColor.color_1a1a1a, fontWeight: FontWeight.bold),
      // titlePadding: EdgeInsets.only(top: 8.px),
      content: Text(message),
      contentTextStyle: TextStyle(fontSize: 15.px, color: MyColor.color_333333),
      // contentPadding: EdgeInsets.only(top: 8.px),
      actions: renderActions(context),
    );
  }

  List<Widget> renderActions(BuildContext context) {
    List<Widget> itemList = [];

    Widget leftItem = FlatButton(
      child: Text(leftTitle, style: TextStyle(fontSize: 16.px, color: MyColor.color_999999)),
      onPressed: () {
        Navigator.of(context).pop();
        if (leftPressed != null) {
          leftPressed!();
        }
      },
    );
    if(leftPressed != null) {
      itemList.add(leftItem);
    }


      Widget item = FlatButton(
        child: Text(rightTitle, style: TextStyle(fontSize: 16.px, color: MyColor.mainColor)),
        onPressed: () {
          Navigator.of(context).pop();
          if (leftPressed != null) {
            rightPressed();
          }
        },
      );
      itemList.add(item);


    return itemList;
  }
}