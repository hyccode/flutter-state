import 'package:flutter_state/generated/json/base/json_convert_content.dart';
import 'package:flutter_state/generated/json/base/json_field.dart';

class HistoryListBeanEntity with JsonConvert<HistoryListBeanEntity> {
	String reason;
	List<HistoryListBeanResult> result;
	@JSONField(name: "error_code")
	int errorCode;
}

class HistoryListBeanResult with JsonConvert<HistoryListBeanResult> {
	String day;
	String date;
	String title;
	@JSONField(name: "e_id")
	String eId;
}
