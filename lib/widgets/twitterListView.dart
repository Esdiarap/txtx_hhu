import 'package:flutter/material.dart';
import './twitterBottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TwitterListView extends StatefulWidget {
  @override
  State<TwitterListView> createState() => _TwitterListViewState();
}

class _TwitterListViewState extends State<TwitterListView> {
  // const TwitterListView({Key? key}) : super(key: key);
  String comment; // 评论
  TextEditingController controller = TextEditingController();
  String avatarURL =
      'https://txtx-1312564927.cos.ap-nanjing.myqcloud.com/skadi2.JPG'; // 默认头像地址
  CollectionReference tweetsRef =
      FirebaseFirestore.instance.collection('tweets');

  @override
  void initState() {
    FirebaseAuth auth = FirebaseAuth.instance;
    avatarURL = auth.currentUser.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    /*return ListView.builder(
        itemCount: twitterLists.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      // TODO 这里是发送者的信息，ROW，包括他的图像，他的DisplayName
                      children: [
                        CircleAvatar(
                          radius: 17,
                          child: ClipRRect(
                            child:
                                Image.asset(this.twitterLists[index].avatarURL),
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        // TODO 这里是发送这个tweet的人的名字
                        Text('This is My Name'),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_right_rounded),
                ],
              ),
              Divider(
                height: 15,
                color: Colors.white,
              ),
              GestureDetector(
                onTap: () {
                  // TODO 点击图片进入相应的详情, tweet的图片
                  print('图片详情');
                },
                child: Image.network(
                  twitterLists[index].picURL,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                // TODO 这里是tweet的底部的几个按钮
                child: TwitterBottomWidget(),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 10,
                  child: ClipRRect(
                    child: Image.network(this.avatarURL),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                title: TextField(
                    decoration: InputDecoration.collapsed(hintText: '添加评论...'),
                    controller: this.controller,
                    onChanged: (newValue) {
                      this.comment = newValue;
                    }),
                trailing: TextButton(
                  onPressed: () {
                    print('发布评论 ${this.comment} 并清空输入框');
                    this.controller.clear();
                  },
                  child: Text('发布'),
                ),
              ),
            ],
          );
        });*/
    return FutureBuilder(
      future: tweetsRef.get(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Object>> snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          return Expanded(
              child: ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    // snapshot.data.docs[i].data() 或者是 get()
                    var doc = snapshot.data.docs[index];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                // TODO 这里是发送者的信息，ROW，包括他的图像，他的DisplayName
                                children: [
                                  CircleAvatar(
                                    radius: 17,
                                    child: ClipRRect(
                                      child:
                                          Image.network(doc.get('avatarURL')),
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(doc.get('displayName')),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('点击和这个人进入聊天界面');
                              },
                              child: Icon(
                                IconData(0xe681, fontFamily: 'iconfont'), // 纸飞机
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        GestureDetector(
                          onTap: () {
                            // TODO 点击图片进入相应的详情, tweet的图片
                            print('图片详情');
                          },
                          child: Image.network(
                            doc.get('picURL'),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TwitterBottomWidget(
                            avatarURL: doc.get('avatarURL'),
                            displayName: doc.get('displayName'),
                            topic: doc.get('topic'),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            child: ClipRRect(
                              child: Image.network(this.avatarURL),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          title: TextField(
                              decoration: InputDecoration.collapsed(
                                  hintText: '添加评论...'),
                              controller: this.controller,
                              onChanged: (newValue) {
                                this.comment = newValue;
                              }),
                          trailing: TextButton(
                            onPressed: () {
                              print('发布评论 ${this.comment} 并清空输入框');
                              this.controller.clear();
                            },
                            child: Text('发布'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  }));
        }
      },
    );
  }
}
