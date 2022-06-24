import 'package:flutter/material.dart';

class TwitterBottomWidget extends StatefulWidget {
  // const TwitterBottomWidgetWidget({Key? key}) : super(key: key);
  final String avatarURL;
  final String topic;
  final String displayName;

  const TwitterBottomWidget(
      {Key key, this.avatarURL, this.topic, this.displayName})
      : super(key: key);

  @override
  State<TwitterBottomWidget> createState() => _TwitterBottomWidgetState();
}

class _TwitterBottomWidgetState extends State<TwitterBottomWidget> {
  List<Widget> TwitterBottomWidgets = [];
  bool isLike = false;
  bool isCollected = false;
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          this.isLike = !this.isLike;
                        });
                      },
                      child: Icon(
                        IconData(0xe8ab, fontFamily: 'Iconfont'),
                        color: this.isLike == false ? Colors.white : Colors.red,
                      )),
                  SizedBox(
                    width: 11,
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO 跳转到页面详情的部分，也就是评论的部分
                      print('跳转到评论，发送评论框打开');
                      Navigator.pushNamed(context, '/detail');
                    },
                    child: Icon(
                      IconData(0xe669, fontFamily: 'iconfont'),
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('跳转到聊天界面');
                    },
                    child: Icon(
                      IconData(0xe681, fontFamily: 'iconfont'), // 纸飞机
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print('收藏');
                setState(() {
                  this.isCollected = !this.isCollected;
                });
              },
              child: Icon(
                IconData(0xe60a, fontFamily: 'iconfont'),
                size: 30,
                color: this.isCollected == false ? Colors.white : Colors.red,
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 10,
              child: ClipRRect(
                child: Image.network(widget.avatarURL),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '${widget.displayName}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Text('${widget.topic}'),
          ],
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
    ;
  }
}
