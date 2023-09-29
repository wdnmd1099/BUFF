import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottomNavigationBar/bottomNavigationBar.dart';
import 'stateManage/stateManage.dart';


var globalContext ; //把MyApp的context暴露出去，给class里调用的Provider使用，比如在seachPage.dart里的使用。


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TitleList>(create: (_) => TitleList()),
        // ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        // ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        // ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return MaterialApp(
      builder: BotToastInit(),  //toast配置
      navigatorObservers: [BotToastNavigatorObserver()],  //toast配置
      debugShowCheckedModeBanner: false,
      initialRoute: '/bottomNavigationBar',
      routes: {
        '/bottomNavigationBar': (context) => const bottomNavigationBar(),
      },
    );
  }
}
