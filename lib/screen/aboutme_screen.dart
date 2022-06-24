import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'changeprofile_screen.dart';

class AboutMe extends StatefulWidget {
  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  // const AboutMe({Key? key}) : super(key: key);
  String displayName = 'Nova';
  String photoURL =
      'https://txtx-1312564927.cos.ap-nanjing.myqcloud.com/skadi.jpg';
  String signature = 'Like a nova, shining in the dark';

  @override
  void initState() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    if (user != null) {
      print(user.email);
      if (user.displayName == null) {
        // TODO 这里的更新数据是写死的。
        user.updateDisplayName('Nova');
        print('new display name ${user.displayName}');
        this.displayName = user.displayName;
      }
      if (user.photoURL == null) {
        user.updatePhotoURL(
            'https://txtx-1312564927.cos.ap-nanjing.myqcloud.com/skadi.jpg');
        print('new photoURL ${user.photoURL}');
        this.photoURL = user.photoURL;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome to Universe',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // 跳转到上传界面
                          Navigator.pushNamed(context, '/upload');
                        },
                        child: Icon(
                          // 上传按钮，跳转到上传界面
                          IconData(0xe8c8, fontFamily: 'Iconfont'),
                          size: 24,
                          // color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {
                          // 点击该页面跳转到设置界面
                          Navigator.pushNamed(context, '/setting');
                        },
                        child: Icon(
                          // 设置按钮, 跳转到设置界面
                          IconData(0xf018f, fontFamily: 'Iconfont'),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(this.photoURL),
                    // AssetImage('./images/skadi2.JPG'), // 背景图片，可以从网上拿
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: [Text('1'), Text('帖子')],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: [Text('2'), Text('粉丝')],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: [Text('3'), Text('关注')],
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.displayName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(this.signature),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // TODO 点击进去编辑界面，时间问题，这里就没有实现编辑页面然后更改名字的功能
                    print('进去编辑页面，然后修改名字和自己的头像');
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => ChangeProfileScreen(),
                    );
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 5),
                    ),
                  ),
                  child: Text(
                    '编辑界面',
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void getTweet() async {
  FirebaseFirestore store = FirebaseFirestore.instance;
  // 添加数据
  // final docUser = store.collection('message').doc('My-DOC');
  // final json = {'message': '这是我测试用的json数据', 'text': '这是测试用的text'};
  // await docUser.set(json);

  // 或者在一开始的时候就不初始化ID，则firebase会自动帮你生成ID
  // final docUser = store.collection('message').doc();
  // final json = {
  //   'id': docUser.id,
  //   'text': 'text',
  //   'message': 'message',
  // };

  // 读数据 .snapshots()获取的是所有的Documents
  // store.collection('message').snapshots();
  // final messages = await store.collection('message').snapshots().first;
  // for (var message in messages.docs) {
  //   print(message.data());
  // }
  List<GeoPoint> geopoints = [];
  await for (var snapshot in store.collection('tweets').snapshots()) {
    for (var message in snapshot.docs) {
      var geopoint = message.data()['location'] as GeoPoint;
      // print(message.data()['location'] as GeoPoint);
      geopoints.add(message.data()['location']);
    }
    print(geopoints[0].latitude);

    // .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}
