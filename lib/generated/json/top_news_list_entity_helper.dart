import 'package:flutter_state/model/top_news_list_entity.dart';

topNewsListEntityFromJson(TopNewsListEntity data, Map<String, dynamic> json) {
	if (json['reason'] != null) {
		data.reason = json['reason']?.toString();
	}
	if (json['result'] != null) {
		data.result = new TopNewsListResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> topNewsListEntityToJson(TopNewsListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['reason'] = entity.reason;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

topNewsListResultFromJson(TopNewsListResult data, Map<String, dynamic> json) {
	if (json['stat'] != null) {
		data.stat = json['stat']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<TopNewsListResultData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new TopNewsListResultData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> topNewsListResultToJson(TopNewsListResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['stat'] = entity.stat;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

topNewsListResultDataFromJson(TopNewsListResultData data, Map<String, dynamic> json) {
	if (json['uniquekey'] != null) {
		data.uniquekey = json['uniquekey']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['date'] != null) {
		data.date = json['date']?.toString();
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	if (json['author_name'] != null) {
		data.authorName = json['author_name']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['thumbnail_pic_s'] != null) {
		data.thumbnailPicS = json['thumbnail_pic_s']?.toString();
	}
	if (json['thumbnail_pic_s02'] != null) {
		data.thumbnailPicS02 = json['thumbnail_pic_s02']?.toString();
	}
	if (json['thumbnail_pic_s03'] != null) {
		data.thumbnailPicS03 = json['thumbnail_pic_s03']?.toString();
	}
	return data;
}

Map<String, dynamic> topNewsListResultDataToJson(TopNewsListResultData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uniquekey'] = entity.uniquekey;
	data['title'] = entity.title;
	data['date'] = entity.date;
	data['category'] = entity.category;
	data['author_name'] = entity.authorName;
	data['url'] = entity.url;
	data['thumbnail_pic_s'] = entity.thumbnailPicS;
	data['thumbnail_pic_s02'] = entity.thumbnailPicS02;
	data['thumbnail_pic_s03'] = entity.thumbnailPicS03;
	return data;
}