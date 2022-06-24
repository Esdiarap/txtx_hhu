import 'package:flutter/material.dart';
import '../widgets/inputtextfield.dart';
import '../widgets/gobutton.dart';
import '../functions/signup.dart';

class SignupScreen extends StatelessWidget {
  // const SignupScreen({Key? key}) : super(key: key);
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
                    'Universe \n Signup',
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
                  isObscure: false,
                  onChange: (newValue) {
                    this.password = newValue;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                GoButton(
                  insideText: '注册',
                  onPressed: () {
                    Signup(this.email, this.password, context);
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
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    '点我去登录呀!',
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
