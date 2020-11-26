import 'package:flutter_state/net/base_repository.dart';
import 'package:flutter_state/providers/view_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_model.dart';

abstract class BaseRefreshViewModel<T extends BaseRepository>
    extends BaseViewModel<T> {
  BaseRefreshViewModel({ViewState state}) : super(state: state);

  RefreshController _refreshController = RefreshController();

  RefreshController get refreshController => _refreshController;

  /// 通用请求数据方法 子类可以复写
  Future<dynamic> refreshData(Future<dynamic> requestApi) async {
    var result;
    try {
      result = await requestApi;
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<dynamic> loadMoreData(Future<dynamic> requestApi) async {
    var result;
    try {
      result = await requestApi;
    } catch (e) {
      print(e.toString());
    }
    return result;
  }
}
