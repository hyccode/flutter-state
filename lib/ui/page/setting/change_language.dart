import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/generated/l10n.dart';
import 'package:flutter_state/providers/locale_provider.dart';
import 'package:flutter_state/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

List<Tuple3> list = [
  Tuple3('English', "English",Locale('en', 'US')),
  Tuple3('简体中文', "Chinese,Simplified",Locale('zh', 'CN')),
];

class ChangeLanguagePage extends StatelessWidget {
  int ids = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).language),
      ),
      body: ListView.separated(
        separatorBuilder: (context, idx) => Divider(),
        itemBuilder: (context, idx) => ListTile(
          // trailing: Checkbox(value: Provider.of<ThemeModel>(context,listen: false).locale == list[idx].item3),
          trailing: Checkbox(value: Provider.of<CurrentLocale>(context,listen: false).value == list[idx].item3),
          title: Text(list[idx].item1),
          subtitle: Text(list[idx].item2),
          onTap: () {
            // Provider.of<ThemeModel>(context,listen: false).setLanguage(list[idx].item3);
            Provider.of<CurrentLocale>(context,listen: false).setLocale(list[idx].item3);
          },
        ),
        itemCount: list.length,
      ),
    );
  }
}
