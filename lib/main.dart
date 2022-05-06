import 'package:flutter/material.dart';
import 'package:flutter_tips/pages/top_page.dart';

// tips:エントリーポイント
void main() {
  runApp(const MyApp());
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

