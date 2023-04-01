import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/pages/login.dart';
import 'package:flutter_insta/utils/app.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext _, AsyncSnapshot<User?> user) {
          if (user.hasData) {
            // 내부 파이어베이스 유저 정보 조회 with user.data.uid
            return const App();
          } else {
            return const Login();
          }
        });
  }
}
