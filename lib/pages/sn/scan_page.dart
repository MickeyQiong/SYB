import 'package:leshua/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  var stateSetter;
  IconData lightIcon = Icons.flash_on;
  ScanController controller = ScanController();

  void getResult(String result) {
    Navigator.pop(context,result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarSelf.wAppBae('扫码'),
      body: Stack(children: [
        ScanView(
          controller: controller,
          scanAreaScale: .7,
          scanLineColor: MyColor.mainColor,
          onCapture: (data) {
            if (data.length < 10) {
              controller.resume();
              return;
            }
            //getResult(data);
          },
        ),
        Positioned(
          right: 15,
          top: 50,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              stateSetter = setState;
              return MaterialButton(
                  child: const Text(
                    '闪光灯',
                    style:
                    TextStyle(color: MyColor.mainColor, fontSize: 16),
                  ),
                  onPressed: () {
                    controller.toggleTorchMode();
                    // if (lightIcon == Icons.flash_on) {
                    //   lightIcon = Icons.flash_off;
                    // } else {
                    //   lightIcon = Icons.flash_on;
                    // }
                    stateSetter(() {});
                  });
            },
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    controller.resume();
    controller.pause();
    super.dispose();
  }
}
