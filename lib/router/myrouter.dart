import 'package:flutter/material.dart';
import 'package:testflutter/screen/home_screen.dart';
import 'package:testflutter/screen/map_screen.dart';
import '../screen/aboutme_screen.dart';
import '../screen/login_screen.dart';
import '../screen/upload_screen.dart';
import '../screen/recommand_screen.dart';

class MyRouter extends StatefulWidget {
  // const MyRouter({Key? key}) : super(key: key);

  @override
  State<MyRouter> createState() => _MyRouterState();
}

class _MyRouterState extends State<MyRouter> {
  var allPages = [
    HomeScreen(),
    MapScreen(),
    UploadScreen(),
    RecommandScreen(),
    AboutMe()
  ];
  int currentIndex = 0;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allPages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // 背景颜色
        currentIndex: currentIndex, // 现在的下标
        type: BottomNavigationBarType.fixed, // 默认是fixed
        unselectedItemColor: Colors.white, // 未选中title项颜色
        selectedItemColor: Colors.greenAccent[300], //
        unselectedLabelStyle: TextStyle(color: Colors.red),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe8b9, fontFamily: 'Iconfont'),
              ),
              label: '首页'),
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe8ad, fontFamily: 'Iconfont'),
              ),
              label: '电子地图'),
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe8c8, fontFamily: 'Iconfont'),
              ),
              label: '上传'),
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe8ab, fontFamily: 'Iconfont'),
              ),
              label: '喜欢'),
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe75e, fontFamily: 'Iconfont'),
              ),
              label: '我的'),
        ],
        onTap: (index) {
          setState(() {
            print('the index is ${index}');
            if (index == 2) {
              Navigator.pushNamed(context, '/upload');
            } else {
              currentIndex = index;
            }
          });
        },
      ),
    );
  }
}
