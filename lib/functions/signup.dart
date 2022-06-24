import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Signup {
  final String email;
  final String passworld;

  Signup(this.email, this.passworld, BuildContext context) {
    signup(context);
  }

  void signup(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth
        .createUserWithEmailAndPassword(
            email: this.email, password: this.passworld)
        .then((value) {
      print('注册成功');
      Navigator.pushNamedAndRemoveUntil(context, '/myrouter', (route) => false);
    }).catchError((err) {
      print('注册失败，回去重新来过');
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    });
  }
}
