import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class MyStorage {
  final storage = FirebaseStorage.instance;
  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);
    try {
      await storage.ref('test/${fileName}').putFile(file);
    } catch (e) {
      print(e);
    }
  }

  Future<String> downloadURL(String fileName) async {
    String downloadURL = await storage.ref('test/${fileName}').getDownloadURL();
    return downloadURL;
  }
}
