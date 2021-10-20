import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ABBASNAZARI/cv.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    check();
  }

  void check() {
    if (Get.size.height > Get.size.width) {
      print('mobile web');
    } else {
      print('pc web');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ABBAS NAZARI | عباس نظری',
      theme: ThemeData(primarySwatch: Colors.blue, accentColor: Colors.white),
      home: Scaffold(
        body: CVPage(),
      ),
    );
  }
}
