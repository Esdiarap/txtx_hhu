import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// 测试用
import 'package:testflutter/screen/map_screen.dart';
import './screen/welcome_screen.dart';
import './screen/login_screen.dart';
import './screen/signup_screen.dart';
import './screen/aboutme_screen.dart';
import './router/myrouter.dart';
import './screen/forgetpwd_screen.dart';
import './screen/setting.dart';
import './screen/upload_screen.dart';
import './screen/home_screen.dart';
import './screen/detail_screen.dart';
import './screen/recommand_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.teal,
//         appBar: AppBar(
//           backgroundColor: Colors.blueGrey,
//           title: const Center(
//             child: Text('First App'),
//           ),
//         ),
//         body: SafeArea(
//           child: Center(
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 50.0,
//                   backgroundImage: AssetImage('images/skadi.jpg'),
//                 ),
//                 Text(
//                   'Andy Flyuu',
//                   style: TextStyle(
//                     fontFamily: 'Pacifico',
//                     fontSize: 40,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Flutter Developer',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     color: Colors.white,
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 10.0, horizontal: 25.0),
//                     child: ListTile(
//                       leading: Icon(
//                         Icons.phone,
//                         size: 20,
//                         color: Colors.teal,
//                       ),
//                       title: Text(
//                         '+44 123 456 789',
//                         style: TextStyle(
//                           color: Colors.teal.shade900,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Card(
//                   color: Colors.white,
//                   margin: const EdgeInsets.symmetric(
//                       vertical: 10.0, horizontal: 25.0),
//                   child: ListTile(
//                     leading: Icon(
//                       Icons.phone,
//                       size: 20,
//                       color: Colors.teal,
//                     ),
//                     title: Text(
//                       '+44 123 456 789',
//                       style: TextStyle(
//                         color: Colors.teal.shade900,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DicePage extends StatefulWidget {
//   const DicePage({Key? key}) : super(key: key);
//
//   @override
//   State<DicePage> createState() => _DicePageState();
// }
//
// class _DicePageState extends State<DicePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         children: [
//           Expanded(
//               child: TextButton(
//                   onPressed: () {
//                     setState(() {});
//                   },
//                   child: Image.asset('images/skadi.jpg'))),
//           Expanded(
//               child: TextButton(
//                   onPressed: () {}, child: Image.asset('images/skadi.jpg'))),
//         ],
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     List<Icon> answers = [];
//     answers.add(Icon(
//       Icons.phone,
//       color: Colors.white,
//     ));
//
//     answers.add(
//       Icon(
//         Icons.sailing,
//         color: Colors.white,
//       ),
//     );
//
//     answers.add(
//       Icon(
//         Icons.sailing,
//         color: Colors.white,
//       ),
//     );
//
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Expanded(
//                   flex: 5,
//                   child: Center(
//                     child: Text(
//                       'This is a Text',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30.0,
//                         fontFamily: 'Pacifico',
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: TextButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.blue),
//                       textStyle: MaterialStateProperty.all(
//                         TextStyle(
//                           color: Colors.red, // 这里设置颜色是不起效果的
//                           fontSize: 20.0,
//                           letterSpacing: 5.0,
//                           fontFamily: 'Pacifico',
//                         ),
//                       ),
//                       foregroundColor:
//                           MaterialStateProperty.all(Colors.white), // 设置字体的颜色
//                     ),
//                     onPressed: () {},
//                     child: Text('Right'),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: TextButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.red),
//                       textStyle: MaterialStateProperty.all(
//                         TextStyle(
//                           color: Colors.white, // 这里设置颜色是不起效果的
//                           fontSize: 20.0,
//                           letterSpacing: 5.0,
//                           fontFamily: 'Pacifico',
//                         ),
//                       ),
//                       foregroundColor:
//                           MaterialStateProperty.all(Colors.white), // 设置字体的颜色
//                     ),
//                     onPressed: () {},
//                     child: Text('Wrong'),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Row(
//                   children: answers,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        // '/': (context) => MyRouter(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/myrouter': (context) => MyRouter(),
        '/aboutme': (context) => AboutMe(),
        '/setting': (context) => SettingScreen(),
        '/forgetpwd': (context) => ForgetPwdScreen(),
        '/upload': (context) => UploadScreen(),
        '/emap': (context) => MapScreen(),
        '/home': (context) => HomeScreen(),
        '/detail': (context) => DetailScreen(),
        '/recommand': (context) => RecommandScreen(),
      },
    );
  }
}
