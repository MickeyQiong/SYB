import 'package:leshua/router/delegate.dart';
import 'package:leshua/style/app_style.dart';
import 'package:leshua/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leshua/component/toast_show.dart';
import 'package:leshua/pages/home.dart';
import 'package:leshua/pages/launch_page.dart';
import 'package:leshua/pages/my_page.dart';
import 'package:leshua/riverpod/merchant_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [MyProviderObserver()],
      child: MyApp(),
    )
  );
  MyToast.setToastStyle();
}

final homeIndexProvider = StateProvider((ref) => 0);

MyRouterDelegate routerDelegate = MyRouterDelegate();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key){
    routerDelegate.push(const LaunchPage());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize();
    SpUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //复制粘贴等改为中文
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CN'),
        Locale('en', 'US'),
      ],
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: MyColor.lightColorScheme(Brightness.light),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(color: Colors.white,fontSize: 18.px),
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: MyColor.mainColor,
              systemOverlayStyle:
                  const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                      statusBarBrightness: Brightness.dark
                  ),
              elevation: 0)
      ),
      // darkTheme: ThemeData(
      //     useMaterial3: true,
      //     colorScheme: MyColor.darkColorScheme(Brightness.dark),
      // ),
      home: Router(
          routerDelegate: routerDelegate,
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(ref),
      body: _contentWidget()[ref.watch(homeIndexProvider)],
    );
  }

  BottomNavigationBar _bottomNavigationBar(WidgetRef ref) {
    return BottomNavigationBar(
      items: _item(),
      onTap: (index) {
        ref.read(homeIndexProvider.notifier).state = index;
        if(index == 0) {
          ref.read(todayTotalAmount.notifier).getTodayTotal();
        }
      },
      currentIndex: ref.watch(homeIndexProvider),
      fixedColor: MyColor.mainColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
    );
  }

  List<Widget> _contentWidget() {
    return [HomePage(), MyPage()];
  }

  List<BottomNavigationBarItem> _item() {
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
    ];
  }
}

class MyProviderObserver implements ProviderObserver {
  @override
  void didAddProvider(ProviderBase<dynamic> provider, Object? value, ProviderContainer container) {
    debugPrint('add provider: $provider, value: $value');
  }

  @override
  void didDisposeProvider(ProviderBase<dynamic> provider, ProviderContainer containers) {
    debugPrint('disposed provider: $provider');
  }

  @override
  void didUpdateProvider(ProviderBase<dynamic> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    debugPrint('update provider: $provider, newValue: $newValue');
  }

  @override
  void providerDidFail(ProviderBase<dynamic> provider, Object error, StackTrace stackTrace, ProviderContainer container) {

  }
}
