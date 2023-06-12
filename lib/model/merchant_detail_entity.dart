import 'package:leshua/generated/json/base/json_field.dart';
import 'package:leshua/generated/json/merchant_detail_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class MerchantDetailEntity {

	MerchantDetailCacheMerchantInfo? cacheMerchantInfo;
	bool? canRegister;
	List<MerchantDetailMerchantInfo>? merchantInfo;
  
  MerchantDetailEntity();

  factory MerchantDetailEntity.fromJson(Map<String, dynamic> json) => $MerchantDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $MerchantDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MerchantDetailCacheMerchantInfo {

	MerchantDetailCacheMerchantInfoMerInfoBaseTempVO? merInfoBaseTempVO;
	MerchantDetailCacheMerchantInfoMerSettleInfoTempVO? merSettleInfoTempVO;
	MerchantDetailCacheMerchantInfoMerchantContactTempInfoVO? merchantContactTempInfoVO;
	int? step;
  
  MerchantDetailCacheMerchantInfo();

  factory MerchantDetailCacheMerchantInfo.fromJson(Map<String, dynamic> json) => $MerchantDetailCacheMerchantInfoFromJson(json);

  Map<String, dynamic> toJson() => $MerchantDetailCacheMerchantInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MerchantDetailCacheMerchantInfoMerInfoBaseTempVO {

	String? auditRemark;
	String? auditStatus;
	String? auditTime;
	String? createTime;
	String? docType;
	String? idCardBackPicUrl;
	String? idCardCode;
	String? idCardEndTime;
	String? idCardFrontPicUrl;
	String? idCardStartTime;
	String? idcardHandPicUrl;
	String? legalPerson;
	String? legalPhone;
	String? mcc;
	String? merCode;
	String? merName;
	String? merShortName;
	String? merType;
	String? useStatus;
  
  MerchantDetailCacheMerchantInfoMerInfoBaseTempVO();

  factory MerchantDetailCacheMerchantInfoMerInfoBaseTempVO.fromJson(Map<String, dynamic> json) => $MerchantDetailCacheMerchantInfoMerInfoBaseTempVOFromJson(json);

  Map<String, dynamic> toJson() => $MerchantDetailCacheMerchantInfoMerInfoBaseTempVOToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MerchantDetailCacheMerchantInfoMerSettleInfoTempVO {

	String? accLevel;
	String? accName;
	String? accNum;
	String? bankCardPicUrl;
	String? bankCityCode;
	String? bankCityName;
	String? bankCode;
	String? bankName;
	String? bankNameBranch;
	String? bankProvCode;
	String? bankProvName;
	String? branchCode;
	String? linkNo;
	String? phone;
  
  MerchantDetailCacheMerchantInfoMerSettleInfoTempVO();

  factory MerchantDetailCacheMerchantInfoMerSettleInfoTempVO.fromJson(Map<String, dynamic> json) => $MerchantDetailCacheMerchantInfoMerSettleInfoTempVOFromJson(json);

  Map<String, dynamic> toJson() => $MerchantDetailCacheMerchantInfoMerSettleInfoTempVOToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MerchantDetailCacheMerchantInfoMerchantContactTempInfoVO {

	String? addrDetail;
	String? cityCode;
	String? contactorPhone;
	String? csPhone;
	String? distinctCode;
	String? provCode;
  
  MerchantDetailCacheMerchantInfoMerchantContactTempInfoVO();

  factory MerchantDetailCacheMerchantInfoMerchantContactTempInfoVO.fromJson(Map<String, dynamic> json) => $MerchantDetailCacheMerchantInfoMerchantContactTempInfoVOFromJson(json);

  Map<String, dynamic> toJson() => $MerchantDetailCacheMerchantInfoMerchantContactTempInfoVOToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MerchantDetailMerchantInfo {

	String? merCode;
	MerchantDetailMerchantInfoMerInfoBaseTempVO? merInfoBaseTempVO;
	MerchantDetailMerchantInfoMerSettleInfoTempVO? merSettleInfoTempVO;
	MerchantDetailMerchantInfoMerchantContactTempInfoVO? merchantContactTempInfoVO;
  
  MerchantDetailMerchantInfo();

  factory MerchantDetailMerchantInfo.fromJson(Map<String, dynamic> json) => $MerchantDetailMerchantInfoFromJson(json);

  Map<String, dynamic> toJson() => $MerchantDetailMerchantInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MerchantDetailMerchantInfoMerInfoBaseTempVO {

	String? auditRemark;
	String? auditStatus;
	String? auditTime;
	String? createTime;
	String? docType;
	String? idCardBackPicUrl;
	String? idCardCode;
	String? idCardEndTime;
	String? idCardFrontPicUrl;
	String? idCardStartTime;
	String? idcardHandPicUrl;
	String? legalPerson;
	String? legalPhone;
	String? mcc;
	String? merCode;
	String? merName;
	String? merShortName;
	String? merType;
	String? useStatus;
  
  MerchantDetailMerchantInfoMerInfoBaseTempVO();

  factory MerchantDetailMerchantInfoMerInfoBaseTempVO.fromJson(Map<String, dynamic> json) => $MerchantDetailMerchantInfoMerInfoBaseTempVOFromJson(json);

  Map<String, dynamic> toJson() => $MerchantDetailMerchantInfoMerInfoBaseTempVOToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MerchantDetailMerchantInfoMerSettleInfoTempVO {

	String? accLevel;
	String? accName;
	String? accNum;
	String? bankCardPicUrl;
	String? bankCityCode;
	String? bankCityName;
	String? bankCode;
	String? bankName;
	String? bankNameBranch;
	String? bankProvCode;
	String? bankProvName;
	String? branchCode;
	String? linkNo;
	String? phone;
  
  MerchantDetailMerchantInfoMerSettleInfoTempVO();

  factory MerchantDetailMerchantInfoMerSettleInfoTempVO.fromJson(Map<String, dynamic> json) => $MerchantDetailMerchantInfoMerSettleInfoTempVOFromJson(json);

  Map<String, dynamic> toJson() => $MerchantDetailMerchantInfoMerSettleInfoTempVOToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MerchantDetailMerchantInfoMerchantContactTempInfoVO {

	String? addrDetail;
	String? cityCode;
	String? contactorPhone;
	String? csPhone;
	String? distinctCode;
	String? provCode;
  
  MerchantDetailMerchantInfoMerchantContactTempInfoVO();

  factory MerchantDetailMerchantInfoMerchantContactTempInfoVO.fromJson(Map<String, dynamic> json) => $MerchantDetailMerchantInfoMerchantContactTempInfoVOFromJson(json);

  Map<String, dynamic> toJson() => $MerchantDetailMerchantInfoMerchantContactTempInfoVOToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}