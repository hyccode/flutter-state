import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state/config/application.dart';
import 'package:flutter_state/model/widget.dart';
import 'package:flutter_state/ui/page/practice/provider_example.dart';
import 'package:flutter_state/ui/page/practice/proxyProvider_example.dart';
import 'package:flutter_state/ui/page/practice/select_example.dart';

import 'cosumer_example.dart';
import 'demo/SettingPageDemo.dart';
import 'exposing_a_value.dart';
import 'multiprovider.dart';

class PracticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      separatorBuilder: (context, idx) => Divider(),
      itemBuilder: (context, idx) => ListTile(
          title: Text(widgetPoints[idx].name),
          onTap: () => Application.router
              .navigateTo(context, widgetPoints[idx].routerName)),
      itemCount: widgetPoints.length,
    );
  }
}

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'provider example',
    routerName: "/practice/providerExample",
    buildRouter: (BuildContext context) => ProviderExamplePage(),
  ),
  WidgetPoint(
    name: 'exposing a value',
    routerName: "/practice/exposing",
    buildRouter: (BuildContext context) => ExposingExamplePage(),
  ),
  WidgetPoint(
    name: 'MultiProvider example',
    routerName: "/practice/multiProviderExamplePage",
    buildRouter: (BuildContext context) => MultiProviderExamplePage(),
  ),
  WidgetPoint(
    name: 'ProxyProvider example',
    routerName: "/practice/ProxyProviderExamplePage",
    buildRouter: (BuildContext context) => ProxyProviderExamplePage(),
  ),
  WidgetPoint(
    ////https://blog.csdn.net/u013894711/article/details/102785532
    name: 'cosumer example',
    routerName: "/practice/cosumer",
    buildRouter: (BuildContext context) => CosumerExamplePage(),
    // buildRouter: (BuildContext context) => CosumerPage(),
  ),
  WidgetPoint(
    ////https://blog.csdn.net/u013894711/article/details/102782366?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.control
    name: 'select example',
    routerName: "/practice/select",
    buildRouter: (BuildContext context) => SelectPage(),
  ),
];
