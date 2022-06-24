import 'package:flutter/material.dart';
import './settingItem.dart';

class SettingWidget extends StatelessWidget {
  // const SettingWidget({Key? key}) : super(key: key);
  final List<SettingItem> items = [];
  SettingWidget() {
    items.add(SettingItem(
      Icon(IconData(0xe605, fontFamily: 'Iconfont')),
      Text('更多消息功能'),
      Icon(Icons.arrow_forward_outlined),
    ));
    items.add(SettingItem(
      Icon(IconData(0xe60f, fontFamily: 'Iconfont')),
      Text(
        '关注和邀请好友',
        style: TextStyle(fontSize: 17),
      ),
      Icon(Icons.arrow_forward_outlined),
    ));
    items.add(SettingItem(
      Icon(IconData(0xe62d, fontFamily: 'Iconfont')),
      Text(
        '通知',
        style: TextStyle(fontSize: 17),
      ),
      Icon(Icons.arrow_forward_outlined),
    ));
    items.add(SettingItem(
      Icon(IconData(0xe662, fontFamily: 'Iconfont')),
      Text(
        '隐私',
        style: TextStyle(fontSize: 17),
      ),
      Icon(Icons.arrow_forward_outlined),
    ));
    items.add(SettingItem(
      Icon(IconData(0xec4d, fontFamily: 'Iconfont')),
      Text(
        '安全',
        style: TextStyle(fontSize: 17),
      ),
      Icon(Icons.arrow_forward_outlined),
    ));
    items.add(SettingItem(
      Icon(IconData(0xeb77, fontFamily: 'Iconfont')),
      Text(
        '关于',
        style: TextStyle(fontSize: 17),
      ),
      Icon(Icons.arrow_forward_outlined),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: items[index].leading,
          title: items[index].title,
          trailing: items[index].trailing,
        );
      },
    );
  }
}
