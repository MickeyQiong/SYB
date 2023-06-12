import 'package:flutter/material.dart';
import 'package:leshua/component/common_widget.dart';

class BillDetailPage extends StatelessWidget {
  const BillDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(context, '账单明细'),
    );
  }
}
