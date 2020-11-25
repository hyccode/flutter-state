import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state/config/application.dart';
import 'package:flutter_state/config/routes.dart';
import 'package:flutter_state/generated/l10n.dart';
import 'package:flutter_state/model/widget.dart';
import 'package:tuple/tuple.dart';

import 'change_language.dart';
import 'change_theme_color.dart';

class SettingPage extends StatelessWidget {
  List<Tuple2> list = [
    Tuple2(S.current.language, Routes.language),
    Tuple2(S.current.theme_color, Routes.color),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      separatorBuilder: (context, idx) => Divider(
        color: Color(0xFFF5F5F5),
      ),
      itemBuilder: (context, idx) => ListTile(
          title: Text(list[idx].item1),
          onTap: () => Application.router.navigateTo(context, list[idx].item2)),
      itemCount: list.length,
    );
  }
}
