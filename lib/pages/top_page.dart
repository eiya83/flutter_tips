import 'dart:developer';

import 'package:flutter/material.dart';

import 'api_sample.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('root'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed:(){onPressedApiSample(context);}, child: const Text('API Sample'))
          ],
        ),
      ),
    );
  }

  // API Sampleボタンの押下時イベント
  void onPressedApiSample(BuildContext context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ApiSamplePage()));
  }
}
