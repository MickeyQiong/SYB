import 'package:leshua/generated/json/base/json_convert_content.dart';
import 'package:leshua/model/check_sn_bind_entity.dart';

CheckSnBindEntity $CheckSnBindEntityFromJson(Map<String, dynamic> json) {
	final CheckSnBindEntity checkSnBindEntity = CheckSnBindEntity();
	final bool? needCheck = jsonConvert.convert<bool>(json['needCheck']);
	if (needCheck != null) {
		checkSnBindEntity.needCheck = needCheck;
	}
	final String? checkUrl = jsonConvert.convert<String>(json['checkUrl']);
	if (checkUrl != null) {
		checkSnBindEntity.checkUrl = checkUrl;
	}
	return checkSnBindEntity;
}

Map<String, dynamic> $CheckSnBindEntityToJson(CheckSnBindEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['needCheck'] = entity.needCheck;
	data['checkUrl'] = entity.checkUrl;
	return data;
}