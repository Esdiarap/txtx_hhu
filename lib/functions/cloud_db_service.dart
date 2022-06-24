import 'package:cloud_firestore/cloud_firestore.dart';

class MyCloudDB {
  final FirebaseFirestore store = FirebaseFirestore.instance;
  Future<void> uploadData(String collectionPath, Map data) async {
    await store.collection(collectionPath).add(data).then((value) {
      print('上传数据到${collectionPath}成功');
    }).catchError((err) {
      print(err);
    });
  }
}
