import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/message_popup.dart';
import '../pages/upload.dart';

// 가독성이 좋게 구현
enum PageName { Home, SEARCH, UPLOAD, ACTICITY, MYPAGE }

// 바텀 네비게이션 바 상태관리
class BottomNavController extends GetxController {
  // BottomNavController를 Get방식으로 찾겠다.
  static BottomNavController get to => Get.find();

  RxInt pageIndex = 0.obs;
  // 중첩 라우터를 위한 글로벌키 설정
  GlobalKey<NavigatorState> searchPageNavKey = GlobalKey<NavigatorState>();

  // 페이지 이동 후 ex) home >> upload >> mypage로 사용자가 페이지 이동 시,
  // 뒤로가기 버튼을 눌렀을 경우 차례대로 뒤로가기
  List<int> bottomHistory = [0];

  void chageBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.Home:
      case PageName.SEARCH:
      case PageName.ACTICITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
      case PageName.UPLOAD:
        Get.to(() => const Upload());
        break;
    }
  }

  // UPLOAD의 인덱스 벨류 값을 변환시키지 않기 위해
  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    // hasGesture가 false일 경우 return을 해줘 bottomHistory.add(value)이벤트가
    // 발생하지 않도록 한다.
    if (!hasGesture) return;

    // bottomHistory의 마지막이 value값이 아닐때 히스토리에 추가
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
    }
    // bottomHistory.add(value);
    // print(bottomHistory);
  }

  Future<bool> popAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopup(
                message: '종료할래?',
                okCallback: () {
                  exit(0);
                },
                cancelCallback: Get.back,
                title: '시스템',
              ));
      return true;
    } else {
      // 현재 페이지를 추출한 다음 서치페이지일 경우 searchPageNavKey.currentState를 추출한 다음
      // maybePop() - 팝할게 있는지 없는지 체크해준다. pop할게 있는 경우 true, 없을경우 false,
      var page = PageName.values[bottomHistory.last];
      if (page == PageName.SEARCH) {
        //
        var value = await searchPageNavKey.currentState!.maybePop();
        // return false - popAction에서 아무것도 안하고 아래로 내려간다.
        if (value) return false;
      }
      // bottomHistory의 마지막 인덱스를 지워 뒤로갈 페이지 인덱스를 바텀 네비게이션으로 전달
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      chageBottomNav(index, hasGesture: false);
      return false;
    }
  }
}
