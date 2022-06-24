import 'package:flutter/material.dart';
import '../widgets/inputtextfield.dart';
import '../widgets/gobutton.dart';
import '../functions/login.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              minimum: EdgeInsets.only(top: 50),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    'Universe \n Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Pacifico',
                      letterSpacing: 5,
                      color: Colors.white,
                      decoration: null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
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
                  isObscure: true,
                  onChange: (newValue) {
                    this.password = newValue;
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgetpwd');
                  },
                  child: Text(
                    '忘记密码',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 15, color: Color(0xff0095f6)),
                  ),
                ),
                GoButton(
                  insideText: '登录',
                  fontsize: 16,
                  onPressed: () {
                    Login(this.email, this.password, context);
                  },
                ),
              ],
            ),
            Column(
              children: [
                Divider(
                  height: 5,
                  color: Color(0xff8b8b8b),
                ),
                SizedBox(
                  height: 3,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    '点我去注册Universe',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff0095f6),
                        fontFamily: 'LXGWWenKai'),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
