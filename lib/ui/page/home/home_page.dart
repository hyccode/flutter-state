import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/providers/locale_provider.dart';
import 'package:flutter_state/ui/page/main/main_page.dart';
import 'package:flutter_state/ui/page/practice/practice_page.dart';
import 'package:flutter_state/ui/page/setting/SettingPage.dart';
import 'package:flutter_state/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState整个页面重绘了1");
    // Provider.of<CurrentLocale>(context).initListHome();
    Provider.of<CurrentLocale>(context, listen: false).initListHome();
  }

  @override
  Widget build(BuildContext context) {
    print("build整个页面重绘了");
    // return ChangeNotifierProvider(
    // create: (_) => HomeViewModel(Provider.of<CurrentLocale>(context).listHome)
    // ..setList(Provider.of<CurrentLocale>(context).listHome),
    return ChangeNotifierProxyProvider<CurrentLocale, HomeViewModel>(
        //     update: (_, locale, __) => HomeViewModel(locale.listHome),
        update: (_, locale, __) => HomeViewModel(locale.value),
        child: Consumer(
          builder: (BuildContext context, HomeViewModel homeViewModel,
              Widget child) {
            return Scaffold(
              body: PageView(
                controller: homeViewModel.controller,
                onPageChanged: (index) {
                  homeViewModel.pageChanged(index);
                },
                children: [
                  MainPage(),
                  PracticePage(),
                  SettingPage(),
                ],
              ),
              appBar: AppBar(
                // title: Text(Provider.of<CurrentLocale>(context, listen: false)
                //     .listHome[homeViewModel.currentIndex]),
                title: Text(homeViewModel.list[homeViewModel.currentIndex]),
              ),
              bottomNavigationBar: BottomNavigationBar(
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.green,
                currentIndex: homeViewModel.currentIndex,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  homeViewModel.controller.jumpToPage(index);
                  homeViewModel.pageChanged(index);
                },
                items: Provider.of<CurrentLocale>(context, listen: false)
                    .listHome
                    .asMap()
                    .keys
                    .map((index) => BottomNavigationBarItem(
                          icon: Icon(homeViewModel.listIcon[index]),
                          label:
                              Provider.of<CurrentLocale>(context, listen: false)
                                  .listHome[index],
                        ))
                    .toList(),
              ),
            );
          },
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
