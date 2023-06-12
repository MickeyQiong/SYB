import 'package:leshua/generated/json/base/json_field.dart';
import 'package:leshua/generated/json/login_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LoginInfoEntity {

	//{"exipreTime":20230312101724,"user":{"userId":"516","username":"18911753754",
	// "password":"it's a secret","mobile":"18911753754","status":1,"createTime":"2023-02-22 18:46:38",
	// "lastLoginTime":"2023-02-25 10:17:24","orgGrade":"0","userType":"merchant","productFlag":"syb",
	// "id":"18911753754","manager":false}
	int? exipreTime;
	LoginInfoDataUser? user;
	String? token;
  
  LoginInfoEntity();

  factory LoginInfoEntity.fromJson(Map<String, dynamic> json) => $LoginInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $LoginInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginInfoDataUser {

	String? userId;
	String? username;
	String? password;
	String? mobile;
	int? status;
	String? createTime;
	String? lastLoginTime;
	String? orgGrade;
	String? userType;
	String? productFlag;
	String? id;
	bool? manager;
  
  LoginInfoDataUser();

  factory LoginInfoDataUser.fromJson(Map<String, dynamic> json) => $LoginInfoDataUserFromJson(json);

  Map<String, dynamic> toJson() => $LoginInfoDataUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}