import 'dart:async';

import 'package:flutter/material.dart';

/// Navigator 2 路由代理类，主要处理push、replace、pop等操作
class MyRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {

  /// 存放Page对象的集合
  final List<Page> _pages = [];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: _onPopPage,
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {}

  @override
  Future<bool> popRoute(){
    if(canPop()){
      _pages.removeLast();
      notifyListeners();
      return Future(() => true);
    }
    return _confirmExit();
  }

  /// 当路由被pop时，该方法会被调用，用以处理路由退栈的逻辑
  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;
    if (canPop()) {
      _pages.removeLast();
      return true;
    } else {
      return false;
    }
  }

  /// 判断是否可以继续退栈
  bool canPop() => _pages.length > 1;

  /// 路由入栈操作
  Future push(Widget page,{dynamic arguments}) async {
    var p = createPage(page,arguments: arguments);
    _pages.add(p);
    notifyListeners();
    return await p.completerResult.future;
  }

  void pop<T extends Object>([T? result]){
    final finder = _pages.removeLast() as CustomPage;
    notifyListeners();
    finder.completerResult.complete(result);
  }

  /// 入栈时替换当前路由
  void replace(Widget page,{dynamic arguments}){
    if(_pages.isNotEmpty){
      _pages.removeLast();
    }
    push(page,arguments: arguments);
  }

  /// 清除所有路由栈,再跳转
  void clearAll(Widget page,{dynamic arguments}){
    _pages.clear();
    push(page,arguments: arguments);
  }

  CustomPage createPage(Widget page,{dynamic arguments}){
    return CustomPage(
        child: page,
        key: Key(page.toStringDeep()) as LocalKey,
        name: page.toStringDeep(),
        arguments: arguments);
  }

  /// 如果退到只剩最后一个路由，弹窗提示
  Future<bool> _confirmExit() async {
    final result = await showDialog<bool>(
      context: navigatorKey!.currentContext!,
      builder: (context){
        return AlertDialog(
          content: const Text('确定要退出APP吗'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context,true),
                child: const Text('取消')
            ),
            TextButton(
                onPressed: () => Navigator.pop(context,false),
                child: const Text('确定')
            )
          ],
        );
      }
    );
    return result ?? true;
  }
}

class CustomPage<T> extends MaterialPage<T> {
  final Completer completerResult;
  CustomPage({
    required Widget child,
    bool maintainState = true,
    bool fullscreenDialog = false,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
  }) : completerResult = Completer(),
      super(
        child: child,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          key: key,
          name: name,
          arguments: arguments,
          restorationId: restorationId
      );
}
