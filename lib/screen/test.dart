import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  // const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text('This is test page'),
        ),
      ),
    );
  }
}
