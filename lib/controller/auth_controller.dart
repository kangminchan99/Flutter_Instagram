import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_insta/binding/init_binding.dart';
import 'package:flutter_insta/models/instagram_user.dart';
import 'package:flutter_insta/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  // 손쉽게 AuthController에 접근하여 받아올 수 있다.
  static AuthController get to => Get.find();

  Rx<InstaUser> user = InstaUser().obs;

  Future<InstaUser?> loginUser(String uid) async {
    // 유저 데이를 조회를 하고
    var userData = await UserRepository.loginUserByUid(uid);
    // 유저 데이터가 널값이 아닌 경우 user에 (userData)를 넣어준다
    if (userData != null) {
      InitBinding.additionalBinding();
      user(userData);
    }
    return userData;
  }

  void sign(InstaUser singupUser, XFile? thumbnail) async {
    if (thumbnail == null) {
      _submitSignup(singupUser);
    } else {
      // 사진이 jpg인지 png인지 모르므로 아래와 같이 설정
      var task = uploadXFile(thumbnail,
          '${singupUser.uid}/profile.${thumbnail.path.split('.').last}');
      task.snapshotEvents.listen((event) async {
        if (event.bytesTransferred == event.totalBytes &&
            event.state == TaskState.success) {
          var downloadUrl = await event.ref.getDownloadURL();
          var updatedUserData = singupUser.copyWith(thumbnail: downloadUrl);
          _submitSignup(updatedUserData);
        }
      });
    }
  }

  UploadTask uploadXFile(XFile file, String filename) {
    var f = File(file.path);
    // users/{uid}/profile.jpg or profile.png
    var ref = FirebaseStorage.instance.ref().child('users').child(filename);

    final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});

    return ref.putFile(f, metadata);
  }

  void _submitSignup(InstaUser signupUser) async {
    var result = await UserRepository.sign(signupUser);
    if (result) {
      loginUser(signupUser.uid!);
    }
  }
}
