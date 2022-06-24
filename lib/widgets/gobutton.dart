import 'package:flutter/material.dart';

class GoButton extends StatelessWidget {
  final Function onPressed;
  final String insideText;
  final double fontsize;

  const GoButton({Key key, this.onPressed, this.insideText, this.fontsize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: this.onPressed,
        child: Text(this.insideText),
        style: ElevatedButton.styleFrom(
          // shadowColor: Colors.green, // 阴影颜色
          shape: RoundedRectangleBorder(
            // 原型按钮
            borderRadius: BorderRadius.circular(7),
          ),
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          primary: Color(0xff0095f6), // 背景颜色
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: this.fontsize,
            letterSpacing: 5,
            fontFamily: 'LXGWWenKai',
          ),
          minimumSize: Size(100, 16),
        ),
      ),
    );
  }
}
