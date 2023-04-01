import 'package:flutter_insta/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    // 인증 관련된 것들을 담담하는 컨트롤러 생성
    Get.put(AuthController(), permanent: true);
  }
}
