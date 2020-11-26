import 'package:flutter/material.dart';
import 'package:flutter_state/generated/l10n.dart';

class CurrentLocale with ChangeNotifier {
  // Locale _locale = const Locale('zh', 'CN');

  Locale _locale;

  Locale get value => _locale;

  var list;

  List get listHome => list;


  void setLocale(locale) {
    _locale = locale;
    S.load(locale).whenComplete(() {
      initListHome();
      notifyListeners();
    });
  }


  void initListHome() {
    list = [
      S.current.home_main,
      S.current.home_practice,
      S.current.home_setting
    ];
  }



}
