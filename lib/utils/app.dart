import 'package:flutter/material.dart';
import 'package:flutter_insta/components/image_data.dart';
import 'package:flutter_insta/controller/bottom_nav_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // onWillPop - 뒤로가기 버튼을 눌렀을 때 이벤트 호출
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(),
        bottomNavigationBar: BottomNavigationBar(
            // 바텀 네비게이션바 타입을 고정
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            // pageIndex에 접근
            currentIndex: controller.pageIndex.value,
            // 바텀 네비게이션 바 선 없애기
            elevation: 0,
            onTap: (value) {},
            items: [
              BottomNavigationBarItem(
                  icon: ImageData(IconsPath.homeOff),
                  activeIcon: ImageData(IconsPath.homeOn),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: ImageData(IconsPath.searchOff),
                  activeIcon: ImageData(IconsPath.searchOn),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: ImageData(IconsPath.uploadIcon), label: 'home'),
              BottomNavigationBarItem(
                  icon: ImageData(IconsPath.activeOff),
                  activeIcon: ImageData(IconsPath.activeOn),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    width: 30,
                    height: 30,
                  ),
                  label: 'home'),
            ]),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
