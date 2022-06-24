import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String hinText;
  final bool isObscure;
  final Function onChange;

  const InputTextField(
      {Key key, this.hinText, this.isObscure = false, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 20, letterSpacing: 1),
      obscureText: this.isObscure,
      textAlign: TextAlign.center,
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        isCollapsed: true,
        fillColor: Color(0xff121212),
        filled: true,
        prefixIconConstraints: BoxConstraints(),
        hintText: this.hinText,
        hintStyle: TextStyle(
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
