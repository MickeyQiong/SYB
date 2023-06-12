import 'package:leshua/generated/json/base/json_field.dart';
import 'package:leshua/generated/json/common_bean_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CommonBeanEntity {

	int? code;
	dynamic data;
	String? message;
  
  CommonBeanEntity();

  factory CommonBeanEntity.fromJson(Map<String, dynamic> json) => $CommonBeanEntityFromJson(json);

  Map<String, dynamic> toJson() => $CommonBeanEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}