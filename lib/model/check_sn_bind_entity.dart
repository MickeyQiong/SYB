import 'package:leshua/generated/json/base/json_field.dart';
import 'package:leshua/generated/json/check_sn_bind_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CheckSnBindEntity {

	bool? needCheck;
	String? checkUrl;
  
  CheckSnBindEntity({this.needCheck = false,this.checkUrl});

  factory CheckSnBindEntity.fromJson(Map<String, dynamic> json) => $CheckSnBindEntityFromJson(json);

  Map<String, dynamic> toJson() => $CheckSnBindEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}