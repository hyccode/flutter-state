import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/ui/page/practice/practice_page.dart';
import 'package:flutter_state/ui/page/setting/SettingPage.dart';
import 'package:flutter_state/widgets/404.dart';

import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String language = "/setting/language";
  static String color = "/setting/color";


  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        // ignore: missing_return
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
          return WidgetNotFound();
        });
    router.define(root, handler: rootHandler);
    router.define(home, handler: homeHandler);
    router.define(language, handler: languageHandler);
    router.define(color, handler: colorHandler);

    widgetPoints.forEach((demo) {
      Handler handler = new Handler(handlerFunc:
          (BuildContext context, Map<String, List<String>> params) {
        if (demo.buildRouter(context) == null) {
          return WidgetNotFound();
        }
        return demo.buildRouter(context);
      });
      router.define('${demo.routerName}', handler: handler);
    });
  }
}


