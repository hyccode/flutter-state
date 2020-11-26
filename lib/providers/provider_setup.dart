import 'package:flutter_state/providers/theme_provider.dart';
import 'package:flutter_state/viewmodel/user_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'locale_provider.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  //此是主题状态注册
  ChangeNotifierProvider(create: (_) => ThemeModel()),
  ChangeNotifierProvider(create: (_) => CurrentLocale()),
  ChangeNotifierProvider(create: (_) => UserModel()),
];

List<SingleChildWidget> dependentServices = [
  //这里使用ProxyProvider来定义需要依赖其他Provider的服务
];