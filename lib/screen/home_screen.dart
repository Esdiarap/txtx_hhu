import 'package:flutter/material.dart';
import 'package:testflutter/widgets/subscribelists.dart';
import 'package:testflutter/widgets/twitterListView.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          // leading: ,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Text('Universe'),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Pacifico',
            fontSize: 20,
            letterSpacing: 2,
          ),
          // shape: Border(bottom: BorderSide(color: Colors.white, width: 1)),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {});
              },
              child: Icon(
                IconData(0xf017d, fontFamily: 'iconfont'), // 刷新
                size: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SubscribeLists(),
            ),
            Divider(
              height: 15,
              color: Colors.white,
            ),
            TwitterListView(),
          ]),
        ));
  }
}
