
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state/config/application.dart';
import 'package:flutter_state/config/routes.dart';
import 'package:flutter_state/generated/l10n.dart';
import 'package:flutter_state/providers/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class SettingPage extends StatelessWidget {
  List<Tuple2> list = [
    Tuple2(S.current.language, Routes.language),
    Tuple2(S.current.theme_color, Routes.color),
  ];

  @override
  Widget build(BuildContext context) {
    print("SettingPage整个页面重绘了");
    // TODO: implement build
    // return Consumer<CurrentLocale>(
    //   builder:  (context, currentLocale, child) {
    //     // list = [
    //     //   Tuple2(S.current.language, Routes.language),
    //     //   Tuple2(S.current.theme_color, Routes.color),
    //     // ];
    //     return ListView.separated(
    //       separatorBuilder: (context, idx) => Divider(
    //       ),
    //       itemBuilder: (context, idx) => ListTile(
    //           title: Text(list[idx].item1),
    //           onTap: () => Application.router.navigateTo(context, list[idx].item2)),
    //       itemCount: list.length,
    //     );
    //   },
    // );
    return ListView.separated(
      separatorBuilder: (context, idx) => Divider(
      ),
      itemBuilder: (context, idx) => ListTile(
          title: Text(list[idx].item1),
          onTap: () => Application.router.navigateTo(context, list[idx].item2)),
      itemCount: list.length,
    );
  }
}

