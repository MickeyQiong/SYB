import 'package:leshua/generated/json/base/json_field.dart';
import 'package:leshua/generated/json/policy_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PolicyModelEntity {

	int? pageNum;
	int? pageSize;
	int? size;
	dynamic orderBy;
	int? startRow;
	int? endRow;
	int? total;
	int? pages;
	List<PolicyModelList>? list;
  
  PolicyModelEntity();

  factory PolicyModelEntity.fromJson(Map<String, dynamic> json) => $PolicyModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $PolicyModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PolicyModelList {

	int? id;
	int? version;
	String? orgNo;
	String? allOrgNo;
	int? orgGrade;
	String? allSaleNo;
	String? createUser;
	String? lastModifyUser;
	int? createTime;
	int? lastModifyTime;
	String? policyType;
	String? policyCode;
	String? policyName;
  
  PolicyModelList();

  factory PolicyModelList.fromJson(Map<String, dynamic> json) => $PolicyModelListFromJson(json);

  Map<String, dynamic> toJson() => $PolicyModelListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}