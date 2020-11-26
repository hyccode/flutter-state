import 'package:flutter/material.dart';
import 'package:flutter_state/config/application.dart';
import 'package:flutter_state/config/routes.dart';
import 'package:flutter_state/generated/l10n.dart';
import 'package:tuple/tuple.dart';

class SettingPageDemo extends StatefulWidget {
  @override
  State<SettingPageDemo> createState() {
    return SettingPageState();
  }
}

class SettingPageState extends State<SettingPageDemo> {
  List<Tuple2> list = [
    Tuple2(S.current.language, Routes.language),
    Tuple2(S.current.theme_color, Routes.color),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        separatorBuilder: (context, idx) => Divider(),
        itemBuilder: (context, idx) => ListTile(
            title: Text(list[idx].item1),
            onTap: () => Application.router.navigateTo(context, list[idx].item2)),
        itemCount: list.length,
      ),
    );
  }
}
