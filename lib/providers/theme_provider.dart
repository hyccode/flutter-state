import 'package:flutter/material.dart';
import 'package:flutter_state/generated/l10n.dart';
import 'package:intl/intl.dart';

/*1.创建theme数据Model
    这里的 Model 实际上就是我们的状态，它不仅储存了我们的数据模型，而且还包含了更改数据的方法，并暴露出它想要暴露出的数据
*/
class ThemeModel with ChangeNotifier {
  Color _themeColor = Colors.blue;
  // Locale _locale;

  Color get value => _themeColor;

  // Locale get locale => _locale;

  void setThemeColor(color) async {
    _themeColor = color;
    print(_themeColor);
    notifyListeners(); //通知依赖的Widget更新
  }

  // void setLanguage(locale) async {
  //   _locale = locale;
  //   S.load(locale).whenComplete(() {
  //     notifyListeners();
  //   });
  // }
}
