import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state/config/application.dart';
import 'package:flutter_state/config/routes.dart';
import 'package:flutter_state/model/widget.dart';
import 'package:flutter_state/ui/page/practice/provider_example.dart';

class PracticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      separatorBuilder: (context, idx) => Divider(
        color: Color(0xFFF5F5F5),
      ),
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
    name: 'provider example',
    routerName: "/practice/providerExample",
    buildRouter: (BuildContext context) => ProviderExamplePage(),
  ),
];
