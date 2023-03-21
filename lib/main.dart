import 'package:flutter/material.dart';
import 'package:flutter_insta/utils/add.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(color: Colors.black))),
      // 바텀 네비게이션바를 관리하고 인덱시스 스택을 사용하여 페이지를 인덱스에 맞게끔 변환시켜준다.
      home: const App(),
    );
  }
}
