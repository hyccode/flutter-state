import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_state/providers/locale_provider.dart';
import 'package:flutter_state/providers/provider_setup.dart';
import 'package:flutter_state/providers/theme_provider.dart';
import 'package:flutter_state/ui/page/home/home_page.dart';
import 'package:provider/provider.dart';

import 'config/application.dart';
import 'config/routes.dart';
import 'generated/l10n.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeModel, CurrentLocale>(
      builder: (context, themeModel, currentLocale, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // primarySwatch: themeModel.value,
          ),
          home: MyHomePage(),
          onGenerateRoute: Application.router.generator,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          // locale: currentLocale.value,
          localeListResolutionCallback: (locales, supportedLocales) {
            // currentLocale.initListHome();
            print('当前系统语言环境$locales支持$supportedLocales');
            return;
          },
        );
      },
    );
  }
}
