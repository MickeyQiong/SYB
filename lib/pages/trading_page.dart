import 'package:flutter/material.dart';
import 'package:leshua/style/app_style.dart';
import 'package:leshua/main.dart';
import 'package:leshua/pages/trading/trading_detail.dart';

class TradingPage extends StatefulWidget {
  const TradingPage({Key? key}) : super(key: key);

  @override
  State<TradingPage> createState() => _TradingPageState();
}

class _TradingPageState extends State<TradingPage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('交易明细'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,bottom: 16,right: 16),
        child: Column(
          children: [
            TabBar(
              controller: TabController(length: 1,vsync: this),
              tabs: const [Tab(text: '商户A',)],
              labelColor: MyColor.mainColor,
              unselectedLabelColor: MyColor.color_1a1a1a,
              indicatorColor: MyColor.mainColor,
              indicatorSize: TabBarIndicatorSize.label,
            ),
            const SizedBox(height: 10,),
            Row(
              children: const [
                Text('2023年1月', style: TextStyle(fontSize: 16),),
                Icon(Icons.keyboard_arrow_down),
                Spacer(),
                Text('筛选', style: TextStyle(fontSize: 16)),
                Icon(Icons.science_outlined)
              ],
            ),
            const SizedBox(height: 20,),
            Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return _item(context);
                  },
                )
            )
          ],
        ),
      ),
    );
  }

  Widget _item(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(backgroundColor: Color(0x99FFC300),),
              const SizedBox(width: 20,),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('刷卡支付',
                        style: TextStyle(fontSize: 14.px)),
                      const SizedBox(height: 10,),
                      Text('成功', style: TextStyle(fontSize: 10.px,color: MyColor.font66(context))),
                      const SizedBox(height: 5,),
                      Text('2023-01-02 12:24:11',
                        style: TextStyle(fontSize: 10.px,color: MyColor.lightGray(context)),),
                    ],
                  )
              ),
              Text('6900', style:TextStyle(fontSize: 14.px),),
              const SizedBox(width: 10,),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,)
            ],
          ),
          const SizedBox(height: 10,),
          const Divider(),
        ],
      ),
      onTap: () => routerDelegate.push(const TradingDetailPage()),
    );
  }
}
