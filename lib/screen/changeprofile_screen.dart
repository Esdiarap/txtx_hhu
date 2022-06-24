import 'package:flutter/material.dart';
import '../widgets/inputtextfield.dart';
import '../widgets/gobutton.dart';

class ChangeProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newName;
    String signature;
    return Container(
      color: Colors.black,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xff2b2b2b),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Universe',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Pacifico',
                letterSpacing: 5,
                color: Colors.white,
                decoration: null,
              ),
            ),
            SizedBox(height: 10),
            InputTextField(
              hinText: '修改名称',
              onChange: (newValue) {
                newName = newValue;
              },
            ),
            SizedBox(height: 20),
            InputTextField(
              hinText: '修改签名',
              onChange: (newValue) {
                signature = newValue;
              },
            ),
            SizedBox(height: 20),
            GoButton(
              insideText: '确认',
              onPressed: () {
                print('修改资料成功');
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
