import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_insta/models/instagram_user.dart';

class UserRepository {
  static Future<InstaUser?> loginUserByUid(String uid) async {
    print(uid);
    // 컬렉션 users의 uid에서 isEqualTo를 사용하여 같은지 조회
    var data = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get();

    if (data.size == 0) {
      return null;
    } else {
      return InstaUser.fromJson(data.docs.first.data());
    }
  }

  static Future<bool> sign(InstaUser user) async {
    try {
      await FirebaseFirestore.instance.collection('users').add(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
