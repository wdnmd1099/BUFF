import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottomNavigationBar/bottomNavigationBar.dart';
import 'stateManage/stateManage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<TitleList>(create: (_) => TitleList()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
