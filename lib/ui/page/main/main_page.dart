import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/generated/l10n.dart';
import 'package:flutter_state/viewmodel/main_model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(S.current.language),
        Expanded(
          child: ListenableProvider(
            create: (_) => MainViewModel(),
            dispose: (context, model) => model.dispose(),
            builder: (context, widget) => SmartRefresher(
              controller: context.watch<MainViewModel>().refreshController,
              onRefresh: context.watch<MainViewModel>().refreshToutiaoData,
              child: context.watch<MainViewModel>().isSuccess()
                  ? ListView.separated(
                      separatorBuilder: (context, idx) => Divider(),
                      itemBuilder: (context, idx) => ListTile(
                        title: Text(
                            context.watch<MainViewModel>().topNewsList[idx].title),
                        onTap: () {},
                      ),
                      itemCount: context.watch<MainViewModel>().topNewsList.length,
                    )
                  : Container(),
            ),
          ),
        ),
      ],
    );
  }
}
