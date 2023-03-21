// 앱이 실행됨과 동시에 getX controller들을 필요에 따라 인스턴스에 올려주기 위한 클래스
import 'package:flutter_insta/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put을 통해 BottomNavController를 받아오고, permanent: true로 두면
    // 인스턴스는 앱이 종료되는 시점까지 계속 살아있다.
    Get.put(BottomNavController(), permanent: true);
  }
}
