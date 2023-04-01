import 'package:flutter_insta/models/instagram_user.dart';
import 'package:flutter_insta/repository/user_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // 손쉽게 AuthController에 접근하여 받아올 수 있다.
  static AuthController get to => Get.find();

  Rx<InstaUser> user = InstaUser().obs;

  Future<InstaUser?> loginUser(String uid) async {
    // DB조회
    var userData = UserRepository.loginUserByUid(uid);
    return userData;
  }

  void sign(InstaUser singupUser) async {
    var result = await UserRepository.sign(singupUser);
    if (result) {
      user(singupUser);
    }
  }
}
