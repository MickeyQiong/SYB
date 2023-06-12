import 'package:leshua/generated/json/base/json_convert_content.dart';
import 'package:leshua/model/policy_model_entity.dart';

PolicyModelEntity $PolicyModelEntityFromJson(Map<String, dynamic> json) {
	final PolicyModelEntity policyModelEntity = PolicyModelEntity();
	final int? pageNum = jsonConvert.convert<int>(json['pageNum']);
	if (pageNum != null) {
		policyModelEntity.pageNum = pageNum;
	}
	final int? pageSize = jsonConvert.convert<int>(json['pageSize']);
	if (pageSize != null) {
		policyModelEntity.pageSize = pageSize;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		policyModelEntity.size = size;
	}
	final dynamic? orderBy = jsonConvert.convert<dynamic>(json['orderBy']);
	if (orderBy != null) {
		policyModelEntity.orderBy = orderBy;
	}
	final int? startRow = jsonConvert.convert<int>(json['startRow']);
	if (startRow != null) {
		policyModelEntity.startRow = startRow;
	}
	final int? endRow = jsonConvert.convert<int>(json['endRow']);
	if (endRow != null) {
		policyModelEntity.endRow = endRow;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		policyModelEntity.total = total;
	}
	final int? pages = jsonConvert.convert<int>(json['pages']);
	if (pages != null) {
		policyModelEntity.pages = pages;
	}
	final List<PolicyModelList>? list = jsonConvert.convertListNotNull<PolicyModelList>(json['list']);
	if (list != null) {
		policyModelEntity.list = list;
	}
	return policyModelEntity;
}

Map<String, dynamic> $PolicyModelEntityToJson(PolicyModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['pageNum'] = entity.pageNum;
	data['pageSize'] = entity.pageSize;
	data['size'] = entity.size;
	data['orderBy'] = entity.orderBy;
	data['startRow'] = entity.startRow;
	data['endRow'] = entity.endRow;
	data['total'] = entity.total;
	data['pages'] = entity.pages;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

PolicyModelList $PolicyModelListFromJson(Map<String, dynamic> json) {
	final PolicyModelList policyModelList = PolicyModelList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		policyModelList.id = id;
	}
	final int? version = jsonConvert.convert<int>(json['version']);
	if (version != null) {
		policyModelList.version = version;
	}
	final String? orgNo = jsonConvert.convert<String>(json['orgNo']);
	if (orgNo != null) {
		policyModelList.orgNo = orgNo;
	}
	final String? allOrgNo = jsonConvert.convert<String>(json['allOrgNo']);
	if (allOrgNo != null) {
		policyModelList.allOrgNo = allOrgNo;
	}
	final int? orgGrade = jsonConvert.convert<int>(json['orgGrade']);
	if (orgGrade != null) {
		policyModelList.orgGrade = orgGrade;
	}
	final String? allSaleNo = jsonConvert.convert<String>(json['allSaleNo']);
	if (allSaleNo != null) {
		policyModelList.allSaleNo = allSaleNo;
	}
	final String? createUser = jsonConvert.convert<String>(json['createUser']);
	if (createUser != null) {
		policyModelList.createUser = createUser;
	}
	final String? lastModifyUser = jsonConvert.convert<String>(json['lastModifyUser']);
	if (lastModifyUser != null) {
		policyModelList.lastModifyUser = lastModifyUser;
	}
	final int? createTime = jsonConvert.convert<int>(json['createTime']);
	if (createTime != null) {
		policyModelList.createTime = createTime;
	}
	final int? lastModifyTime = jsonConvert.convert<int>(json['lastModifyTime']);
	if (lastModifyTime != null) {
		policyModelList.lastModifyTime = lastModifyTime;
	}
	final String? policyType = jsonConvert.convert<String>(json['policyType']);
	if (policyType != null) {
		policyModelList.policyType = policyType;
	}
	final String? policyCode = jsonConvert.convert<String>(json['policyCode']);
	if (policyCode != null) {
		policyModelList.policyCode = policyCode;
	}
	final String? policyName = jsonConvert.convert<String>(json['policyName']);
	if (policyName != null) {
		policyModelList.policyName = policyName;
	}
	return policyModelList;
}

Map<String, dynamic> $PolicyModelListToJson(PolicyModelList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['version'] = entity.version;
	data['orgNo'] = entity.orgNo;
	data['allOrgNo'] = entity.allOrgNo;
	data['orgGrade'] = entity.orgGrade;
	data['allSaleNo'] = entity.allSaleNo;
	data['createUser'] = entity.createUser;
	data['lastModifyUser'] = entity.lastModifyUser;
	data['createTime'] = entity.createTime;
	data['lastModifyTime'] = entity.lastModifyTime;
	data['policyType'] = entity.policyType;
	data['policyCode'] = entity.policyCode;
	data['policyName'] = entity.policyName;
	return data;
}