import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../functions/storage_service.dart';
import '../functions/cloud_db_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../functions/getGPS.dart';
import 'package:uuid/uuid.dart';

class UploadScreen extends StatefulWidget {
  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  // const UploadScreen({Key? key}) : super(key: key);
  File imageFile = null;

  @override
  Widget build(BuildContext context) {
    String message;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('发布新动态'),
        titleTextStyle: TextStyle(color: Colors.white),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async {
              print('发表');
              MyStorage mystorage = MyStorage();
              String filePath = imageFile.path;
              String fileName = imageFile.path.split('image_picker').last;
              // 上传图片到storage
              await mystorage.uploadFile(filePath, fileName).then((value) {
                print('上传到storage成功');
              }).catchError((e) {
                print(e);
              });
              // 下载图片的URL地址
              String downloadURL = await mystorage.downloadURL(fileName);
              // 用户信息
              FirebaseAuth auth = FirebaseAuth.instance;
              User user = auth.currentUser;
              String userEmail = user.email;
              String userDisplayName = user.displayName;
              String avatarURL = user.photoURL;
              // 地理位置信息
              // GeoPoint geopoint = await GetGPS().getGeoPoint();
              GeoPoint geopoint = GeoPoint(31.8, 118.54);
              final Map<String, dynamic> tweet = {
                'location': geopoint,
                'picURL': downloadURL,
                'tweetID': Uuid().v1(),
                'email': userEmail,
                'displayName': userDisplayName,
                'avatarURL': avatarURL,
                'topic': message,
              };
              await MyCloudDB().uploadData('tweets', tweet).then((value) {
                print('上传到数据库成功!');
              });
            },
            child: Text('发布'),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              // color: Colors.black,
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '分享有趣的事情吧',
                ),
                maxLines: 10,
                onChanged: (newValue) {
                  message = newValue;
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: imageFile == null
                  ? null
                  : Image(
                      image: imageFile == null
                          ? AssetImage('./images/skadi2.JPG')
                          : FileImage(imageFile),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width * 0.35,
          //   height: MediaQuery.of(context).size.height * 0.2,
          //   decoration: BoxDecoration(
          //       color: Colors.grey,
          //       shape: BoxShape.circle,
          //       image: DecorationImage(
          //           image: imageFile == null
          //               ? AssetImage('./images/skadi2.JPG')
          //               : FileImage(imageFile),
          //           fit: BoxFit.cover)),
          // ),
          Divider(
            height: 40,
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    print('选择图库上传');
                    _settingModalBottomSheet(context);
                  },
                  child: Icon(
                    Icons.photo,
                    size: 40,
                  )),
              InkWell(
                  onTap: () {
                    print('选择相机拍摄');
                  },
                  child: Icon(
                    Icons.video_camera_front,
                    size: 40,
                  )),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  //********************** IMAGE PICKER
  Future imageSelector(BuildContext context, String pickerType) async {
    switch (pickerType) {
      case "gallery":
        PickedFile selecedFile = await ImagePicker.platform
            .pickImage(source: ImageSource.gallery, imageQuality: 90);
        imageFile = File(selecedFile.path);
        break;

      case "camera":
        PickedFile selecedFile = await ImagePicker.platform
            .pickImage(source: ImageSource.camera, imageQuality: 90);
        imageFile = File(selecedFile.path);
        break;
    }
    if (imageFile != null) {
      print("You selected  image : " + imageFile.path);
      setState(() {
        debugPrint("SELECTED IMAGE PICK   $imageFile");
      });
    } else {
      print("You have not taken image");
    }
  }

// Image picker
  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  title: new Text('Gallery'),
                  onTap: () async {
                    await imageSelector(context, "gallery");
                    Navigator.pop(context);
                  },
                ),
                new ListTile(
                  title: new Text('Camera'),
                  onTap: () async {
                    await imageSelector(context, "camera");
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }
}
