import 'package:flutter/material.dart';
import '../widgets/gobutton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 1,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              // color: Colors.black,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      './images/logo.png',
                      height: 100,
                      width: 100,
                    ),
                    Center(
                      child: Text(
                        'Universe',
                        style: TextStyle(
                          fontSize: 55,
                          fontFamily: 'Pacifico',
                          letterSpacing: 6,
                          color: Colors.white,
                          decoration: null,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GoButton(
                      fontsize: 20,
                      insideText: '登录',
                      onPressed: () async {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  ],
                ),
              ),
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
                Text(
                  'Universe新用户? ',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff8b8b8b),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    '点我注册',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
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
