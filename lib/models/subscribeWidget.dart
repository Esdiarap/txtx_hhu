import 'package:flutter/material.dart';

class SubscribeWidget extends StatelessWidget {
  // const SubscribeItem({Key? key}) : super(key: key);
  final String avatarURL;
  final String name;

  const SubscribeWidget({Key key, this.avatarURL, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            child: ClipRRect(
              child: Image.network(this.avatarURL),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          Text(
            this.name,
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
