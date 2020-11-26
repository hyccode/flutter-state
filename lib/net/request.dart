import 'package:dio/dio.dart';
import 'package:flutter_state/model/history_list_bean_entity.dart';
import 'package:flutter_state/net/request_helper.dart';

import 'base_repository.dart';
import 'request_const.dart';

class HomeRepository extends BaseRepository {
  Dio dio = HttpHelper.instance.getDio();

  HomeRepository() {
    setDio(dio);
  }

  Future<dynamic> requestHomeList() async {
    Map<String, String> map = new Map();
    map["key"] = "37e75772f1cfbdc3e3cfeea6c9094582";
    map["date"] = "1/1";
    return await get(RequestConstApi.HOME_API,params: map).then((baseResult) {
      if(baseResult.code == 0) {
        return HistoryListBeanEntity().fromJson(baseResult.data);
      } else {
        return null;
      }
    });
  }

}

