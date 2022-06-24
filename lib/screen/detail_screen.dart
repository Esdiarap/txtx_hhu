import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('评论详情'),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.white, width: 1)),
        actions: [
          TextButton(
            onPressed: () {
              // TODO 进入到聊天界面
              print('进入到聊天界面');
            },
            child: Icon(
              IconData(0xe681, fontFamily: 'iconfont'), // 纸飞机
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              // TODO 本人图像
                              radius: 15,
                              child: ClipRRect(
                                child: Image.asset('./images/skadi2.JPG'),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'My Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Text('My Comment'),
                          ],
                        ),
                        Divider(
                          height: 10,
                          color: Colors.grey[350],
                        )
                      ],
                    );
                  }),
            ),
            Row(
              children: [
                CircleAvatar(
                  // TODO 本人图像
                  radius: 25,
                  child: ClipRRect(
                    child: Image.network(
                        'https://txtx-1312564927.cos.ap-nanjing.myqcloud.com/skadi2.JPG'),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO 跳转到发送评论的页面
                      print('跳转到发送评论的页面');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey[350], width: 2.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(
                      '添加评论...',
                      style: TextStyle(
                        color: Colors.grey[350],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
