import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ABBASNAZARI/cv.dart';
import 'package:seo_renderer/seo_renderer.dart';

void main() {
  runApp(
    MyApp(),
  );
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ABBAS NAZARI | عباس نظری',
      theme: ThemeData(primarySwatch: Colors.blue, accentColor: Colors.white),
      navigatorObservers: <RouteObserver<ModalRoute<void>>>[routeObserver],
      home: Scaffold(
        body: CVPage(),
      ),
    );
  }
}
