import 'package:flutter_insta/models/instagram_user.dart';
import 'package:flutter_insta/repository/user_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Future<InstaUser?> loginUser(String uid) async {
    // DB조회
    var userData = UserRepository.loginUserByUid(uid);
    return userData;
  }
}
