import 'package:flutter/material.dart';
import 'package:leshua/style/app_style.dart';

class TradingDetailPage extends StatelessWidget {
  const TradingDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('交易详情'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '商户名称',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            _item(context, '卡号', '79374937249732947'),
            _item(context, '交易金额', '7979'),
            _item(context, '交易时间', '2023-1-3 11:12:13'),
            _item(context, '终端编号', '84289328923823988'),
          ],
        ),
      ),
    );
  }

  Widget _item(BuildContext context, String title, String content) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14.px),
            ),
            Text(
              content,
              style: TextStyle(
                  fontSize: 14.px,
                  color: MyColor.font33(context)),
            )
          ],
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
