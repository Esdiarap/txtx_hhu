import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecommandListView extends StatefulWidget {
  // const RecommandListView({Key? key}) : super(key: key);

  @override
  State<RecommandListView> createState() => _RecommandListViewState();
}

class _RecommandListViewState extends State<RecommandListView> {
  CollectionReference recommandPerson =
      FirebaseFirestore.instance.collection('subscribes');
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: this.recommandPerson.get(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Object>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      var doc = snapshot.data.docs[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 23,
                                  child: ClipRRect(
                                    child: Image.network(
                                        doc.get('subscribeUserPhotoURL')),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  doc.get('subscribeUserDisplayName'),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  child: TextButton(
                                    child: Text(
                                      '关注',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blueAccent)),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Icon(
                                  IconData(0xe658, fontFamily: 'iconfont'),
                                  color: Colors.white,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }));
          }
        });
  }
}
