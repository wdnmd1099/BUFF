import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottomNavigationBar/bottomNavigationBar.dart';
import 'stateManage/stateManage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<MaskDiaLog>(create: (_) => MaskDiaLog()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: '/bottomNavigationBar',
      routes: {
        '/bottomNavigationBar': (context) => const bottomNavigationBar(),
      },
    );
  }
}
