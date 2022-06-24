import 'package:flutter/material.dart';
import '../models/settingWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingScreen extends StatelessWidget {
  // const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Center(
                child: Text(
                  'Universe',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 5,
              thickness: 1,
              color: Colors.white,
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                child: SettingWidget(),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  print('退出登录');
                  FirebaseAuth auth = FirebaseAuth.instance;
                  auth.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: Text('点击退出'),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 15,
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
