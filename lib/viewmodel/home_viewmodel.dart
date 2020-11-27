import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/generated/l10n.dart';
import 'package:flutter_state/viewmodel/base_model.dart';

class HomeViewModel extends BaseViewModel {
  var list;
  var locale;

  List<IconData> listIcon = [
    Icons.home_outlined,
    Icons.work_outline,
    Icons.settings_outlined
  ];
  int _currentIndex = 0;

  PageController _controller = new PageController(
    initialPage: 0,
  );

  HomeViewModel(this.locale) {
    print("$locale");
    list = [
      S.current.home_main,
      S.current.home_practice,
      S.current.home_setting
    ];
  }

  // HomeViewModel(this.locale);

  // factory HomeViewModel() {
  //   var list = [
  //     S.current.home_main,
  //     S.current.home_practice,
  //     S.current.home_setting
  //   ];
  //   final result = HomeViewModel._(list);
  //   return result;
  // }
  //
  // HomeViewModel._(this.list);

  get controller => _controller;

  get currentIndex => _currentIndex;

  // get list {
  //   // return    list = [
  //   //     S.current.home_main,
  //   //     S.current.home_practice,
  //   //     S.current.home_setting
  //   //   ];
  // }

  void pageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setList(List listHome) {
    print("setList");
    list = listHome;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller?.dispose();
  }
}
