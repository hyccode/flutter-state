import 'package:flutter_state/model/history_list_bean_entity.dart';

historyListBeanEntityFromJson(HistoryListBeanEntity data, Map<String, dynamic> json) {
	if (json['reason'] != null) {
		data.reason = json['reason']?.toString();
	}
	if (json['result'] != null) {
		data.result = new List<HistoryListBeanResult>();
		(json['result'] as List).forEach((v) {
			data.result.add(new HistoryListBeanResult().fromJson(v));
		});
	}
	if (json['error_code'] != null) {
		data.errorCode = json['error_code']?.toInt();
	}
	return data;
}

Map<String, dynamic> historyListBeanEntityToJson(HistoryListBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['reason'] = entity.reason;
	if (entity.result != null) {
		data['result'] =  entity.result.map((v) => v.toJson()).toList();
	}
	data['error_code'] = entity.errorCode;
	return data;
}

historyListBeanResultFromJson(HistoryListBeanResult data, Map<String, dynamic> json) {
	if (json['day'] != null) {
		data.day = json['day']?.toString();
	}
	if (json['date'] != null) {
		data.date = json['date']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['e_id'] != null) {
		data.eId = json['e_id']?.toString();
	}
	return data;
}

Map<String, dynamic> historyListBeanResultToJson(HistoryListBeanResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['day'] = entity.day;
	data['date'] = entity.date;
	data['title'] = entity.title;
	data['e_id'] = entity.eId;
	return data;
}