import 'package:flutter/material.dart';
import '../models/subscribeWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SubscribeLists extends StatelessWidget {
  final List<SubscribeWidget> lists = [];
  User user;
  String currentUserEmail;
  SubscribeLists() {
    user = FirebaseAuth.instance.currentUser;
    currentUserEmail = user.email;
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('subscribes').snapshots(),
      builder: (context, snapshot) {
        // 先清空lists
        lists.clear();
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final subscribes = snapshot.data.docs; // 获取document
        for (var subscribe in subscribes) {
          String email = subscribe.get('userEmail');
          if (email == currentUserEmail) {
            // 是当前的人订阅的
            String displayName = subscribe.get('subscribeUserDisplayName');
            String photoURL = subscribe.get('subscribeUserPhotoURL');
            lists.add(SubscribeWidget(
              avatarURL: photoURL,
              name: displayName,
            ));
          }
        }
        return Row(children: lists);
      },
    );
  }
}
