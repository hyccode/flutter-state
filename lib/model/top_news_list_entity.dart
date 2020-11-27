import 'package:flutter_state/generated/json/base/json_convert_content.dart';
import 'package:flutter_state/generated/json/base/json_field.dart';

class TopNewsListEntity with JsonConvert<TopNewsListEntity> {
	String reason;
	TopNewsListResult result;
}

class TopNewsListResult with JsonConvert<TopNewsListResult> {
	String stat;
	List<TopNewsListResultData> data;
}

class TopNewsListResultData with JsonConvert<TopNewsListResultData> {
	String uniquekey;
	String title;
	String date;
	String category;
	@JSONField(name: "author_name")
	String authorName;
	String url;
	@JSONField(name: "thumbnail_pic_s")
	String thumbnailPicS;
	@JSONField(name: "thumbnail_pic_s02")
	String thumbnailPicS02;
	@JSONField(name: "thumbnail_pic_s03")
	String thumbnailPicS03;
}
