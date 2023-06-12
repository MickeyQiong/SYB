import 'package:leshua/generated/json/base/json_convert_content.dart';
import 'package:leshua/model/common_bean_entity.dart';

CommonBeanEntity $CommonBeanEntityFromJson(Map<String, dynamic> json) {
	final CommonBeanEntity commonBeanEntity = CommonBeanEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		commonBeanEntity.code = code;
	}
	final dynamic? data = jsonConvert.convert<dynamic>(json['data']);
	if (data != null) {
		commonBeanEntity.data = data;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		commonBeanEntity.message = message;
	}
	return commonBeanEntity;
}

Map<String, dynamic> $CommonBeanEntityToJson(CommonBeanEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['data'] = entity.data;
	data['message'] = entity.message;
	return data;
}