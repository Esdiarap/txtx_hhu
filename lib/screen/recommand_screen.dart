import 'package:flutter/material.dart';
import '../widgets/recommandListView.dart';

class RecommandScreen extends StatelessWidget {
  // const RecommandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('动态'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        backgroundColor: Colors.black,
        shape: Border(bottom: BorderSide(color: Colors.white, width: 0.1)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '为你推荐',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            RecommandListView(),
          ],
        ),
      ),
    );
  }
}
