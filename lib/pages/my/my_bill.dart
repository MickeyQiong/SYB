 import 'package:leshua/style/app_color.dart';
import 'package:leshua/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:leshua/component/common_widget.dart';
import 'package:leshua/component/popup/easy_popup.dart';
import 'package:leshua/component/popup/easy_popup_child.dart';
import 'package:leshua/main.dart';
import 'package:leshua/pages/my/bill_detail.dart';

import '../../style/app_image.dart';

class MyBillPage extends StatefulWidget {
   const MyBillPage({Key? key}) : super(key: key);

   @override
   State<MyBillPage> createState() => _MyBillPageState();
 }

 class _MyBillPageState extends State<MyBillPage> {
  var key = GlobalKey();
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: commonAppbar(context, '我的账单'),
       body: Container(
         color: Colors.white,
         padding: const EdgeInsets.all(16),
         child: Column(
           children: [
             Row(
               children: [
                 GestureDetector(
                   onTap: (){},
                   child: Row(
                     children: const [
                       Text('2023年1月', style: TextStyle(fontSize: 16),),
                       Icon(Icons.keyboard_arrow_down),
                     ],
                   ),
                 ),
                 const Spacer(),
                 GestureDetector(
                   onTap: (){
                     var offset = Offset(0,SizeFit.statusHeight);
                     EasyPopup.show(context, Popup(),offsetLT: offset);
                   },
                   child: Row(
                     children: const [
                       Text('筛选', style: TextStyle(fontSize: 16)),
                       Icon(Icons.science_outlined)
                     ],
                   ),
                 ),
               ],
             ),
             SizeFit.sizedBoxH20,
             Container(
               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
               decoration: BoxDecoration(
                   image: DecorationImage(
                       image: Image.asset(MyImage.bgBillTop).image,
                       fit: BoxFit.fill),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Column(
                     children: [
                       commonText('总金额(元)',color: Colors.white,size: 16),
                       SizeFit.sizedBoxH10,
                       commonText('3000.00',color: Colors.white,size: 18,weight: FontWeight.bold)
                     ],
                   ),
                   Column(
                     children: [
                       commonText('消费笔数(笔)',color: Colors.white,size: 16),
                       SizeFit.sizedBoxH10,
                       commonText('3',color: Colors.white,size: 18,weight: FontWeight.bold)
                     ],
                   ),
                 ],
               ),
             ),
             SizeFit.sizedBoxH20,
             _item('刷卡支付'),
             _item('扫码支付'),
             _item('移动支付'),
           ],
         ),
       ),
     );
   }

   Widget _item(String title){
     return GestureDetector(
       onTap: () => routerDelegate.push(const BillDetailPage()),
       child: Container(
         color: Colors.white,
         child: Column(
           children: [
             Row(
               children: [
                 Image.asset(MyImage.mySetting,width: 30,height: 30,),
                 SizeFit.sizedBoxW10,
                 commonText(title,size: 16),
                 SizeFit.sizedBoxW10,
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                   decoration: BoxDecoration(
                     color: const Color(0x45FFC300),
                     borderRadius: BorderRadius.circular(5)
                   ),
                   child: Center(child: commonText('消费',color: const Color.fromARGB(255, 232, 178, 0)),),
                 )
               ],
             ),
             Row(
               children: [
                 const Spacer(),
                 commonText('999.5'),
                 SizeFit.sizedBoxW10,
                 const Icon(Icons.arrow_forward_ios,size: 12,)
               ],
             ),
             Row(
               children: [
                 const SizedBox(width: 40,),
                 commonText('2023-01-01 12:12:12',color: MyColor.grayColor(context)),
                 const Spacer(),
                 commonText('消费1000.00',color: MyColor.grayColor(context)),
                 const SizedBox(width: 22,)
               ],
             ),
             SizeFit.sizedBoxH10,
             const Divider()
           ],
         ),
       ),
     );
   }
 }

 class Popup extends StatelessWidget with EasyPopupChild {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: SizeFit.statusHeight,
        ),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _item('刷卡支付'),
                  _item('扫码支付'),
                  _item('移动支付'),
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(onPressed: (){}, child: commonText('取消')),
                  ElevatedButton(onPressed: (){}, child: commonText('确定'))
                ],
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ],
    );
  }

  Widget _item(String title){
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: commonText(title),),
    );
  }

  @override
  dismiss() {

  }

 }
