import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // onWillPop - 뒤로가기 버튼을 눌렀을 때 이벤트 호출
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
