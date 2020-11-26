import 'package:flutter_state/model/history_list_bean_entity.dart';
import 'package:flutter_state/net/request.dart';
import 'package:flutter_state/providers/view_state.dart';
import 'package:flutter_state/viewmodel/base_refresh_model.dart';

class MainViewModel extends BaseRefreshViewModel<HomeRepository> {
  HistoryListBeanEntity _historyListBean;

  List<HistoryListBeanResult> get historyList => _historyListBean?.result;

  MainViewModel({ViewState state}):super(state: state) {
    refreshHomeListData();
  }

  void refreshHomeListData() async {
    var historyListBean = await refreshData(mRepository.requestHomeList());
    if (historyListBean?.errorCode == 0) {
      _historyListBean = historyListBean;
      setSuccess();
    }
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  @override
  HomeRepository createRepository() {
    return HomeRepository();
  }
}
