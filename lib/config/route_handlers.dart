import 'package:flutter_state/ui/page/main/main_page.dart';

import 'package:flutter/painting.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/ui/page/setting/change_language.dart';
import 'package:flutter_state/ui/page/setting/change_theme_color.dart';

import '../main.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MyApp();
});

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MyHomePage();
});

var languageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ChangeLanguagePage();
});

var colorHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ChangeThemeColorPage();
});
