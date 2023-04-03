import 'package:flutter/material.dart';
import 'package:flutter_insta/controller/auth_controller.dart';
import 'package:flutter_insta/models/instagram_user.dart';
import 'package:get/get.dart';

// this를 사용하려면  with GetTickerProviderStateMixin를 해줘야한다.
class MyPageController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  Rx<InstaUser> targetUser = InstaUser().obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    _loadData();
  }

  void setTargetUser() {
    // 마이 페이지가 내 화면인지, 내가 친구의 페이지로 방문한 것인지를 구분
    var uid = Get.parameters['targetUid'];
    if (uid == null) {
      targetUser(AuthController.to.user.value);
    } else {
      // 상대 uid로 users.collection을 조회
    }
  }

  void _loadData() {
    setTargetUser();
    // 포스트 리스트 로드

    // 사용자 정보 로드
  }
}
