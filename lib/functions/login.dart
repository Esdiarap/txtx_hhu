import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login {
  final String email;
  final String password;
  Login(this.email, this.password, BuildContext context) {
    login(context);
  }
  void login(BuildContext context) async {
    // Navigator.pu
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth
        .signInWithEmailAndPassword(email: this.email, password: this.password)
        .then((value) {
      print('登陆成功!');
      Navigator.pushNamedAndRemoveUntil(context, '/myrouter', (route) => false);
    }).catchError((err) {
      print('登录失败，回去重新来过');
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    });
  }
}
