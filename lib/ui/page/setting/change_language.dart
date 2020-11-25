import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/generated/l10n.dart';
import 'package:tuple/tuple.dart';

List<Tuple2> list = [
  Tuple2('English', "English"),
  Tuple2('简体中文', "Chinese,Simplified"),
];

class ChangeLanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).language),
      ),
      body: ListView.separated(
        separatorBuilder: (context, idx) => Divider(
          color: Color(0xFFF5F5F5),
        ),
        itemBuilder: (context, idx) => ListTile(
          title: Text(list[idx].item1),
          subtitle: Text(list[idx].item2),
          onTap: () {},
        ),
        itemCount: list.length,
      ),
    );
  }
}
