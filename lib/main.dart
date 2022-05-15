import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tips/pages/top_page.dart';
import 'package:provider/provider.dart';
import 'notifier/poke_notifier.dart';

// tips:エントリーポイント
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final pokemonsNotifier = PokemonsNotifier();
  HttpOverrides.global = new MyHttpOverrides();

  runApp(
    // tips:下位ツリーのWidgetから上位ツリーのWidgetが管理する状態にアクセスする手段を提供します
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonsNotifier>(
          create: (context) => pokemonsNotifier,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tips',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // tips:home画面の設定
      home: const TopPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}