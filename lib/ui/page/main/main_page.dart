import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/generated/l10n.dart';
import 'package:intl/intl.dart';
import 'package:flutter_state/ui/page/practice/practice_page.dart';
import 'package:flutter_state/ui/page/setting/SettingPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var list = [
    S.current.home_main,
    S.current.home_practice,
    S.current.home_setting
  ];
  List<IconData> listIcon = [
    Icons.home_outlined,
    Icons.work_outline,
    Icons.settings_outlined
  ];
  int _currentIndex = 0;
  PageController _controller = new PageController(
    initialPage: 0,
  );

  void _changeLanguage() async {
    print('修改前语言环境:${Intl.getCurrentLocale()}');
    await S.load(Locale('en', 'US'));
    //setState刷新页面改变语言
    setState(() {
      list = [
        S.current.home_main,
        S.current.home_practice,
        S.current.home_setting
      ];
    });
    print('修改后语言环境:${Intl.getCurrentLocale()}');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _changeLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(list[_currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: list
            .asMap()
            .keys
            .map((index) => BottomNavigationBarItem(
                  icon: Icon(listIcon[index]),
                  label: list[index],
                ))
            .toList(),
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Container(),
          PracticePage(),
          SettingPage(),
        ],
      ),
    );
  }
}
