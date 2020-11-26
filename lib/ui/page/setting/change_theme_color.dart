import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/generated/l10n.dart';
import 'package:flutter_state/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ChangeThemeColorPage extends StatelessWidget {
  int ids = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).theme_color),
      ),
      body: ListView.separated(
        separatorBuilder: (context, idx) => Divider(),
        itemBuilder: (context, idx) => ListTile(
          leading: Container(
              color: list[idx].item2,
              width: 40,
              height: 40,
              child: Provider.of<ThemeModel>(context,listen: false).value == list[idx].item2 ? Icon(Icons.check) : Center()),
          title: Text(list[idx].item1),
          onTap: () {
            //更换主题
            // Provider.of<Counter>(context).countColors(index);
            Provider.of<ThemeModel>(context,listen: false).setThemeColor(list[idx].item2);
          },
        ),
        itemCount: list.length,
      ),
    );
  }
}

List<Tuple2> list = [
  Tuple2(
    '基础蓝',
    Colors.blue,
  ),
  Tuple2(
    '天空蓝',
    Colors.lightBlue,
  ),
  Tuple2(
    '茶色',
    Colors.teal,
  ),
  Tuple2(
    '骚粉',
    Colors.pink,
  ),
  Tuple2(
    '基础黄',
    Colors.yellow,
  ),
  Tuple2(
    '基础橙',
    Colors.orange,
  ),
  Tuple2(
    '彤彤红',
    Colors.red,
  ),
  Tuple2(
    '小草绿',
    Colors.green,
  ),
  Tuple2(
    '淡灰色',
    Colors.cyan,
  ),
  // Tuple2(
  //   '棕色',
  //   Colors.grey[900],
  // ),
  // Tuple2(
  //   '暗夜黑',
  //   Colors.black,
  // ),
];
