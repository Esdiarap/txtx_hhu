import 'package:flutter/material.dart';
import '../widgets/inputtextfield.dart';
import '../widgets/gobutton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPwdScreen extends StatelessWidget {
  // const ForgetPwdScreen({Key? key}) : super(key: key);
  String email;
  String password;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                '忘记密码',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  letterSpacing: 5,
                  color: Colors.white,
                  decoration: null,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InputTextField(
              hinText: 'Email Address',
              isObscure: false,
              onChange: (newValue) {
                this.email = newValue;
              },
            ),
            SizedBox(
              height: 10,
            ),
            InputTextField(
              hinText: 'Password',
              isObscure: false,
              onChange: (newValue) {
                this.password = newValue;
              },
            ),
            SizedBox(
              height: 10,
            ),
            GoButton(
              insideText: '确认修改密码',
              fontsize: 17,
              onPressed: () async {
                // 修改密码
                User user = auth.currentUser;
                if (user != null) {
                  // 已经登录了
                  user.updatePassword(this.password).then((_) {
                    print('成功修改密码，重新登陆吧');
                    auth.signOut(); // 取消登录
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  }).catchError((err) {
                    print('出错了');
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  });
                } else {
                  // 还没登录，比较麻烦
                  await auth.sendPasswordResetEmail(email: this.email);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
