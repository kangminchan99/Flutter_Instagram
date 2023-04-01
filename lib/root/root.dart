import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/controller/auth_controller.dart';
import 'package:flutter_insta/models/instagram_user.dart';
import 'package:flutter_insta/pages/login.dart';
import 'package:flutter_insta/utils/app.dart';
import 'package:get/get.dart';

import '../pages/signup.dart';

class Root extends GetView<AuthController> {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext _, AsyncSnapshot<User?> user) {
          if (user.hasData) {
            // _, snapshot - buildcontext, snapshot
            return FutureBuilder<InstaUser?>(
                future:
                    // 내부 파이어베이스 유저 정보 조회 with user.data.uid
                    controller.loginUser(user.data!.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const App();
                  } else {
                    return Obx(
                      () => controller.user.value.uid != null
                          ? const App()
                          : SignUp(uid: user.data!.uid),
                    );
                  }
                });
          } else {
            return const Login();
          }
        });
  }
}
