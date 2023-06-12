import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leshua/riverpod/riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../model/policy_model_entity.dart';

class MyPolicyPage extends StatelessWidget {
  const MyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的政策'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(policyListProvider);
          return state.when(
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
              empty: () => const Text('empty'),
              ready: (data) => _buildContent(context, ref, data),
              error: (error) => Text(error));
        },
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, WidgetRef ref, List<PolicyModelList> data) {
    return SmartRefresher(
        onRefresh: () => ref.watch(policyListProvider.notifier).refreshData(),
        controller: ref.watch(policyListProvider.notifier).refreshController,
        child:ListView.builder(
            itemBuilder: (context, index) {
              return Text(data[index].policyName ?? '');
            },
            itemCount: data.length,
          )
        );
  }
}
