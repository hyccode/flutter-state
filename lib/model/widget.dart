import "package:flutter/material.dart";

class WidgetPoint {
  //名称
  String name;

  //内容
  String content;

  // 路由地址
  final String routerName;

  final Color color;

  final WidgetBuilder buildRouter;

  WidgetPoint(
      {this.name, this.routerName, this.buildRouter, this.content, this.color});
}
