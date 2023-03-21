import 'package:flutter/material.dart';
import 'package:flutter_insta/components/image_data.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // onWillPop - 뒤로가기 버튼을 눌렀을 때 이벤트 호출
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: ImageData(IconsPath.homeOff),
              activeIcon: ImageData(IconsPath.homeOn),
              label: 'home'),
          BottomNavigationBarItem(
              icon: ImageData(IconsPath.homeOff),
              activeIcon: ImageData(IconsPath.homeOn),
              label: 'home'),
          BottomNavigationBarItem(
              icon: ImageData(IconsPath.homeOff),
              activeIcon: ImageData(IconsPath.homeOn),
              label: 'home'),
          BottomNavigationBarItem(
              icon: ImageData(IconsPath.homeOff),
              activeIcon: ImageData(IconsPath.homeOn),
              label: 'home'),
          BottomNavigationBarItem(
              icon: ImageData(IconsPath.homeOff),
              activeIcon: ImageData(IconsPath.homeOn),
              label: 'home'),
        ]),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
