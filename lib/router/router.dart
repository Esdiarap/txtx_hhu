// import 'package:flutter/material.dart';
// import '../screen/aboutme_screen.dart';
// import '../screen/login_screen.dart';
// import '../screen/signup_screen.dart';
// import '../screen/test.dart';
//
// class Router extends StatefulWidget {
//   // const Router({Key? key}) : super(key: key);
//
//   @override
//   State<Router> createState() => _RouterState();
// }
//
// class _RouterState extends State<Router> {
//   // const AboutMe({Key? key}) : super(key: key);
//   var allPages = [
//     Test(),
//     SignupScreen(),
//     LoginScreen(),
//     LoginScreen(),
//     LoginScreen()
//   ];
//   int currentIndex = 0;
//
//   @override
//   void initState() {}
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: allPages[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black, // 背景颜色
//         currentIndex: currentIndex, // 现在的下标
//         type: BottomNavigationBarType.fixed, // 默认是fixed
//         unselectedItemColor: Colors.teal, // 未选中title项颜色
//         selectedItemColor: Colors.blue, //
//         unselectedLabelStyle: TextStyle(color: Colors.red),
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 IconData(0xe8ad, fontFamily: 'Iconfont'),
//               ),
//               label: '电子地图'),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 IconData(0xe8c8, fontFamily: 'Iconfont'),
//               ),
//               label: '上传'),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 IconData(0xe8ab, fontFamily: 'Iconfont'),
//               ),
//               label: '喜欢'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite_outline), label: '我的'),
//         ],
//         onTap: (index) {
//           setState(() {
//             print('the index is ${index}');
//             currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
