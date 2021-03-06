// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:image_picker/image_picker.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _HomeScreen();
//   }
// }
//
// class _HomeScreen extends State<HomeScreen> {
//   File imageFile = null;
//   final picker = ImagePicker();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: Text(
//             "HomeScreen",
//             textAlign: TextAlign.center,
//           ),
//         ),
//         body: SafeArea(
//           top: true,
//           bottom: true,
//           child: Align(
//             alignment: Alignment.center,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                     width: MediaQuery.of(context).size.width * 0.35,
//                     height: MediaQuery.of(context).size.height * 0.2,
//                     margin: EdgeInsets.only(top: 20),
//                     decoration: BoxDecoration(
//                         color: Colors.grey,
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                             image: imageFile == null
//                                 ? AssetImage('./images/skadi1.JPG')
//                                 : FileImage(imageFile),
//                             fit: BoxFit.cover))),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 RaisedButton(
//                     onPressed: () {
//                       _settingModalBottomSheet(context);
//                     },
//                     child: Text("Take Photo")),
//               ],
//             ),
//           ),
//         ));
//   }
//
//   //********************** IMAGE PICKER
//   Future imageSelector(BuildContext context, String pickerType) async {
//     print('now iam here2');
//     switch (pickerType) {
//       case "gallery":
//
//         /// GALLERY IMAGE PICKER
//         var selectedImage = await picker.pickImage(
//             source: ImageSource.gallery, imageQuality: 90);
//         imageFile = File(selectedImage.path);
//         break;
//
//       case "camera": // CAMERA CAPTURE CODE
//         var photoImage = await picker.pickImage(
//             source: ImageSource.camera, imageQuality: 90);
//         print('using camera');
//         imageFile = File(photoImage.path);
//         break;
//     }
//
//     if (imageFile != null) {
//       print("You selected  image : " + imageFile.path);
//       setState(() {
//         debugPrint("SELECTED IMAGE PICK   $imageFile");
//       });
//     } else {
//       print("You have not taken image");
//     }
//   }
//
//   // Image picker
//   void _settingModalBottomSheet(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return Container(
//             child: new Wrap(
//               children: <Widget>[
//                 new ListTile(
//                     title: new Text('Gallery'),
//                     onTap: () => {
//                           imageSelector(context, "gallery"),
//                           Navigator.pop(context),
//                         }),
//                 new ListTile(
//                   title: new Text('Camera'),
//                   onTap: () => {
//                     print('now i am here'),
//                     imageSelector(context, "camera"),
//                     Navigator.pop(context)
//                   },
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
