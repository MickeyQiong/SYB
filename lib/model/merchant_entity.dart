import 'package:leshua/generated/json/base/json_field.dart';
import 'package:leshua/generated/json/merchant_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class MerchantEntity {

	String? activateTime;
	String? activatedStatus;
	String? addrDetail;
	String? agentCode;
	String? allOrgNo;
	String? allSaleNo;
	String? auditRemark;
	String? auditStatus;
	String? auditTime;
	String? bankChannelId;
	String? bankNo;
	String? bindStatus;
	String? bizScope;
	String? busLicenseEndTime;
	String? busLicenseNo;
	String? busLicenseStartTime;
	String? channelMerchantNo;
	String? channelProxyNo;
	String? cityCode;
	String? cityName;
	String? contactorName;
	String? contactorNameShow;
	String? contactorPhone;
	String? contactorPhoneShow;
	String? createShowName;
	String? createTime;
	String? createUser;
	String? createUserName;
	String? csPhone;
	String? customMccType;
	String? customMerType;
	String? discountFlag;
	String? distinctCode;
	String? distinctName;
	String? docType;
	double? id;
	String? idCardCode;
	String? idCardCodeShow;
	String? idCardEndTime;
	String? idCardStartTime;
	String? inType;
	String? insResv3;
	String? invoiceName;
	String? isOpenTwoFee;
	String? isStandardMer;
	String? isUnionPayMer;
	String? lastModifyShowName;
	String? lastModifyTime;
	String? lastModifyUser;
	String? lastModifyUserName;
	String? latitude;
	String? legalPerson;
	String? legalPersonShow;
	String? legalPhone;
	String? legalPhoneShow;
	String? longitude;
	String? mcc;
	String? mccOne;
	String? mccTwo;
	String? merCode;
	String? merLevel;
	String? merName;
	String? merShortName;
	String? merType;
	double? orgGrade;
	String? orgNo;
	String? provCode;
	String? provName;
	String? proxyCode;
	String? proxyName;
	String? proxyType;
	String? registeCode;
	String? rtsStatus;
	String? rtsTime;
	double? serviceFee;
	String? shopName;
	@JSONField(name: "source")
	String? xSource;
	String? termSerialNo;
	String? unionPayMerCode;
	String? unionpayAuditStatus;
	String? unionpayMerchantNo;
	String? useStatus;
	String? userId;
	String? verifyStatus;
	double? version;
  
  MerchantEntity();

  factory MerchantEntity.fromJson(Map<String, dynamic> json) => $MerchantEntityFromJson(json);

  Map<String, dynamic> toJson() => $MerchantEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}