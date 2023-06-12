import 'package:leshua/generated/json/base/json_convert_content.dart';
import 'package:leshua/model/login_info_entity.dart';

LoginInfoEntity $LoginInfoEntityFromJson(Map<String, dynamic> json) {
	final LoginInfoEntity loginInfoEntity = LoginInfoEntity();
	final int? exipreTime = jsonConvert.convert<int>(json['exipreTime']);
	if (exipreTime != null) {
		loginInfoEntity.exipreTime = exipreTime;
	}
	final LoginInfoDataUser? user = jsonConvert.convert<LoginInfoDataUser>(json['user']);
	if (user != null) {
		loginInfoEntity.user = user;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		loginInfoEntity.token = token;
	}
	return loginInfoEntity;
}

Map<String, dynamic> $LoginInfoEntityToJson(LoginInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['exipreTime'] = entity.exipreTime;
	data['user'] = entity.user?.toJson();
	data['token'] = entity.token;
	return data;
}

LoginInfoDataUser $LoginInfoDataUserFromJson(Map<String, dynamic> json) {
	final LoginInfoDataUser loginInfoDataUser = LoginInfoDataUser();
	final String? userId = jsonConvert.convert<String>(json['userId']);
	if (userId != null) {
		loginInfoDataUser.userId = userId;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		loginInfoDataUser.username = username;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		loginInfoDataUser.password = password;
	}
	final String? mobile = jsonConvert.convert<String>(json['mobile']);
	if (mobile != null) {
		loginInfoDataUser.mobile = mobile;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		loginInfoDataUser.status = status;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		loginInfoDataUser.createTime = createTime;
	}
	final String? lastLoginTime = jsonConvert.convert<String>(json['lastLoginTime']);
	if (lastLoginTime != null) {
		loginInfoDataUser.lastLoginTime = lastLoginTime;
	}
	final String? orgGrade = jsonConvert.convert<String>(json['orgGrade']);
	if (orgGrade != null) {
		loginInfoDataUser.orgGrade = orgGrade;
	}
	final String? userType = jsonConvert.convert<String>(json['userType']);
	if (userType != null) {
		loginInfoDataUser.userType = userType;
	}
	final String? productFlag = jsonConvert.convert<String>(json['productFlag']);
	if (productFlag != null) {
		loginInfoDataUser.productFlag = productFlag;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		loginInfoDataUser.id = id;
	}
	final bool? manager = jsonConvert.convert<bool>(json['manager']);
	if (manager != null) {
		loginInfoDataUser.manager = manager;
	}
	return loginInfoDataUser;
}

Map<String, dynamic> $LoginInfoDataUserToJson(LoginInfoDataUser entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userId'] = entity.userId;
	data['username'] = entity.username;
	data['password'] = entity.password;
	data['mobile'] = entity.mobile;
	data['status'] = entity.status;
	data['createTime'] = entity.createTime;
	data['lastLoginTime'] = entity.lastLoginTime;
	data['orgGrade'] = entity.orgGrade;
	data['userType'] = entity.userType;
	data['productFlag'] = entity.productFlag;
	data['id'] = entity.id;
	data['manager'] = entity.manager;
	return data;
}