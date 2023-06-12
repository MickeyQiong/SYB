import 'package:leshua/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget commonText(String text,
    {Color color = MyColor.black,
    double size = 14,
    int maxLines = 1,
    FontWeight weight = FontWeight.normal}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
  );
}

Widget commonCard(
    {Widget? child, double? radio = 10, Color color = MyColor.white}) {
  return Card(
    color: color,
    shadowColor: MyColor.color_eeeeee,
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radio!)),
    child: child,
  );
}

commonAppbar(BuildContext context,String title,{Color color = Colors.black}){
  return AppBar(title: commonText(title,size: 18,color: color),
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.black, //修改颜色
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),);
}

Widget myInputField(BuildContext context,TextEditingController controller, String label,
    String hint, bool isPassword,{Function? function}) {
  FocusNode focusNode = FocusNode();
  return Column(
    children: [
      TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType:
        isPassword ? TextInputType.visiblePassword : TextInputType.phone,
        //maxLength: isPassword ? null : 11,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          hintText: hint,
        ),
        onEditingComplete: () => debugPrint('onEditingComplete'),
        onChanged: (v){
          if(function != null) {
            function(v);
          }
        },
        onSubmitted: (v) {
          FocusScope.of(context).requestFocus(focusNode);
          debugPrint('onSubmitted:$v');
          //controller.clear();
        },
      ),
      const Divider(),
    ],
  );
}

void showToast(BuildContext context, String message) {
  var snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
