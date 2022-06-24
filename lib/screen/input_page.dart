import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Colors.pinkAccent;
const cardColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  // const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  void initState() {}
  void upload() async {
    String email = "1312252399@qq.com";
    String password = "OH5dmisaka";
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('注册成功');
    }).catchError((err) {
      print('出错了. err is ${err}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // titleTextStyle: TextStyle(),
        // backgroundColor: Color(0xFF0A0E21),
        title: Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusedCard(
                    cardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 80,
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          'Male',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusedCard(
                    cardColor,
                    Column(
                      children: [
                        Text('ds'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusedCard(
              cardColor,
              Column(
                children: [
                  Text('ds'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusedCard(
                    cardColor,
                    Column(
                      children: [
                        Text('ds'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusedCard(
                    cardColor,
                    Column(
                      children: [
                        Text('ds'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: bottomContainerColor,
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

class ReusedCard extends StatelessWidget {
  Color cardColor = Colors.white;
  double margin = 15.0;
  double bRadius = 7.0;

  Widget child;
  ReusedCard(@required this.cardColor, this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(bRadius),
      ),
    );
  }
}
