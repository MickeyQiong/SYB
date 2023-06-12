import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leshua/http/view_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListViewStateNotifier<T> extends StateNotifier<ListViewState<List<T>>> {
  ListViewStateNotifier(
      {required this.fetchItems, this.pageIndex = 1, this.pageSize = 10})
      : super(const ListViewState.loading()) {
    init();
  }

  int _page = 0;
  int pageSize = 10;
  int pageIndex = 1;
  List<T> _items = [];
  final Future<List<T>> Function(int pageIndex, int pageSize) fetchItems;

  final RefreshController _refreshController = RefreshController();

  RefreshController get refreshController => _refreshController;

  void init() {
    refreshData();
  }

  Future<void> refreshData() async {
    _page = pageIndex;
    try {
      final List<T> list = await fetchItems(_page,pageSize);
      if(list.isEmpty){
        state = const ListViewState.empty();
      }else{
        _items = list;
        state = ListViewState.ready(list);
      }
      _page += 1;
    } catch(e) {
      state = ListViewState.error(e.toString());
    }finally {
      _refreshController.refreshCompleted();
    }
  }

  Future<void> loadMore() async {
    try {
      final List<T> list = await fetchItems(_page,pageSize);
      if(list.isNotEmpty){
        _items.addAll(list);
        state = ListViewState.ready(_items);
      }
      _page += 1;
    }catch(e) {
      state = ListViewState.error(e.toString());
      _refreshController.loadFailed();
    }finally {
      _refreshController.loadComplete();
    }
  }

  @override
  void dispose(){
    _refreshController.dispose();
    super.dispose();
  }
}
