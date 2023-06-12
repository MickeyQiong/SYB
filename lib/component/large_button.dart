import 'package:flutter/material.dart';
import 'package:leshua/style/app_style.dart';

class LargeButton extends StatelessWidget {
  final bool enable;
  final String title;
  final VoidCallback onPressed;

  const LargeButton(
      {Key? key,
      this.enable = true,
      required this.title,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.px),
      width: SizeFit.screenWidth - 100.px,
      height: 40.px,
      child: ElevatedButton(
        onPressed: enable ? onPressed : null,
        style: ButtonStyle(
            backgroundColor: enable
                ? MaterialStateProperty.all(MyColor.mainColor)
                : MaterialStateProperty.all(MyColor.color_e8f3f0)),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16.px,
              color:
                  enable ? MyColor.white : MyColor.color_4b4b4b),
        ),
      ),
    );
  }
}

@immutable
class LargeOutlineButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const LargeOutlineButton(this.title, this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.px),
      width: SizeFit.screenWidth - 100.px,
      height: 40.px,
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(const BorderSide(color: MyColor.mainColor))
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 16.px, color:MyColor.mainColor),
        ),
      ),
    );
  }


}
