import 'package:leshua/generated/json/base/json_convert_content.dart';
import 'package:leshua/model/merchant_entity.dart';

MerchantEntity $MerchantEntityFromJson(Map<String, dynamic> json) {
	final MerchantEntity merchantEntity = MerchantEntity();
	final String? activateTime = jsonConvert.convert<String>(json['activateTime']);
	if (activateTime != null) {
		merchantEntity.activateTime = activateTime;
	}
	final String? activatedStatus = jsonConvert.convert<String>(json['activatedStatus']);
	if (activatedStatus != null) {
		merchantEntity.activatedStatus = activatedStatus;
	}
	final String? addrDetail = jsonConvert.convert<String>(json['addrDetail']);
	if (addrDetail != null) {
		merchantEntity.addrDetail = addrDetail;
	}
	final String? agentCode = jsonConvert.convert<String>(json['agentCode']);
	if (agentCode != null) {
		merchantEntity.agentCode = agentCode;
	}
	final String? allOrgNo = jsonConvert.convert<String>(json['allOrgNo']);
	if (allOrgNo != null) {
		merchantEntity.allOrgNo = allOrgNo;
	}
	final String? allSaleNo = jsonConvert.convert<String>(json['allSaleNo']);
	if (allSaleNo != null) {
		merchantEntity.allSaleNo = allSaleNo;
	}
	final String? auditRemark = jsonConvert.convert<String>(json['auditRemark']);
	if (auditRemark != null) {
		merchantEntity.auditRemark = auditRemark;
	}
	final String? auditStatus = jsonConvert.convert<String>(json['auditStatus']);
	if (auditStatus != null) {
		merchantEntity.auditStatus = auditStatus;
	}
	final String? auditTime = jsonConvert.convert<String>(json['auditTime']);
	if (auditTime != null) {
		merchantEntity.auditTime = auditTime;
	}
	final String? bankChannelId = jsonConvert.convert<String>(json['bankChannelId']);
	if (bankChannelId != null) {
		merchantEntity.bankChannelId = bankChannelId;
	}
	final String? bankNo = jsonConvert.convert<String>(json['bankNo']);
	if (bankNo != null) {
		merchantEntity.bankNo = bankNo;
	}
	final String? bindStatus = jsonConvert.convert<String>(json['bindStatus']);
	if (bindStatus != null) {
		merchantEntity.bindStatus = bindStatus;
	}
	final String? bizScope = jsonConvert.convert<String>(json['bizScope']);
	if (bizScope != null) {
		merchantEntity.bizScope = bizScope;
	}
	final String? busLicenseEndTime = jsonConvert.convert<String>(json['busLicenseEndTime']);
	if (busLicenseEndTime != null) {
		merchantEntity.busLicenseEndTime = busLicenseEndTime;
	}
	final String? busLicenseNo = jsonConvert.convert<String>(json['busLicenseNo']);
	if (busLicenseNo != null) {
		merchantEntity.busLicenseNo = busLicenseNo;
	}
	final String? busLicenseStartTime = jsonConvert.convert<String>(json['busLicenseStartTime']);
	if (busLicenseStartTime != null) {
		merchantEntity.busLicenseStartTime = busLicenseStartTime;
	}
	final String? channelMerchantNo = jsonConvert.convert<String>(json['channelMerchantNo']);
	if (channelMerchantNo != null) {
		merchantEntity.channelMerchantNo = channelMerchantNo;
	}
	final String? channelProxyNo = jsonConvert.convert<String>(json['channelProxyNo']);
	if (channelProxyNo != null) {
		merchantEntity.channelProxyNo = channelProxyNo;
	}
	final String? cityCode = jsonConvert.convert<String>(json['cityCode']);
	if (cityCode != null) {
		merchantEntity.cityCode = cityCode;
	}
	final String? cityName = jsonConvert.convert<String>(json['cityName']);
	if (cityName != null) {
		merchantEntity.cityName = cityName;
	}
	final String? contactorName = jsonConvert.convert<String>(json['contactorName']);
	if (contactorName != null) {
		merchantEntity.contactorName = contactorName;
	}
	final String? contactorNameShow = jsonConvert.convert<String>(json['contactorNameShow']);
	if (contactorNameShow != null) {
		merchantEntity.contactorNameShow = contactorNameShow;
	}
	final String? contactorPhone = jsonConvert.convert<String>(json['contactorPhone']);
	if (contactorPhone != null) {
		merchantEntity.contactorPhone = contactorPhone;
	}
	final String? contactorPhoneShow = jsonConvert.convert<String>(json['contactorPhoneShow']);
	if (contactorPhoneShow != null) {
		merchantEntity.contactorPhoneShow = contactorPhoneShow;
	}
	final String? createShowName = jsonConvert.convert<String>(json['createShowName']);
	if (createShowName != null) {
		merchantEntity.createShowName = createShowName;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		merchantEntity.createTime = createTime;
	}
	final String? createUser = jsonConvert.convert<String>(json['createUser']);
	if (createUser != null) {
		merchantEntity.createUser = createUser;
	}
	final String? createUserName = jsonConvert.convert<String>(json['createUserName']);
	if (createUserName != null) {
		merchantEntity.createUserName = createUserName;
	}
	final String? csPhone = jsonConvert.convert<String>(json['csPhone']);
	if (csPhone != null) {
		merchantEntity.csPhone = csPhone;
	}
	final String? customMccType = jsonConvert.convert<String>(json['customMccType']);
	if (customMccType != null) {
		merchantEntity.customMccType = customMccType;
	}
	final String? customMerType = jsonConvert.convert<String>(json['customMerType']);
	if (customMerType != null) {
		merchantEntity.customMerType = customMerType;
	}
	final String? discountFlag = jsonConvert.convert<String>(json['discountFlag']);
	if (discountFlag != null) {
		merchantEntity.discountFlag = discountFlag;
	}
	final String? distinctCode = jsonConvert.convert<String>(json['distinctCode']);
	if (distinctCode != null) {
		merchantEntity.distinctCode = distinctCode;
	}
	final String? distinctName = jsonConvert.convert<String>(json['distinctName']);
	if (distinctName != null) {
		merchantEntity.distinctName = distinctName;
	}
	final String? docType = jsonConvert.convert<String>(json['docType']);
	if (docType != null) {
		merchantEntity.docType = docType;
	}
	final double? id = jsonConvert.convert<double>(json['id']);
	if (id != null) {
		merchantEntity.id = id;
	}
	final String? idCardCode = jsonConvert.convert<String>(json['idCardCode']);
	if (idCardCode != null) {
		merchantEntity.idCardCode = idCardCode;
	}
	final String? idCardCodeShow = jsonConvert.convert<String>(json['idCardCodeShow']);
	if (idCardCodeShow != null) {
		merchantEntity.idCardCodeShow = idCardCodeShow;
	}
	final String? idCardEndTime = jsonConvert.convert<String>(json['idCardEndTime']);
	if (idCardEndTime != null) {
		merchantEntity.idCardEndTime = idCardEndTime;
	}
	final String? idCardStartTime = jsonConvert.convert<String>(json['idCardStartTime']);
	if (idCardStartTime != null) {
		merchantEntity.idCardStartTime = idCardStartTime;
	}
	final String? inType = jsonConvert.convert<String>(json['inType']);
	if (inType != null) {
		merchantEntity.inType = inType;
	}
	final String? insResv3 = jsonConvert.convert<String>(json['insResv3']);
	if (insResv3 != null) {
		merchantEntity.insResv3 = insResv3;
	}
	final String? invoiceName = jsonConvert.convert<String>(json['invoiceName']);
	if (invoiceName != null) {
		merchantEntity.invoiceName = invoiceName;
	}
	final String? isOpenTwoFee = jsonConvert.convert<String>(json['isOpenTwoFee']);
	if (isOpenTwoFee != null) {
		merchantEntity.isOpenTwoFee = isOpenTwoFee;
	}
	final String? isStandardMer = jsonConvert.convert<String>(json['isStandardMer']);
	if (isStandardMer != null) {
		merchantEntity.isStandardMer = isStandardMer;
	}
	final String? isUnionPayMer = jsonConvert.convert<String>(json['isUnionPayMer']);
	if (isUnionPayMer != null) {
		merchantEntity.isUnionPayMer = isUnionPayMer;
	}
	final String? lastModifyShowName = jsonConvert.convert<String>(json['lastModifyShowName']);
	if (lastModifyShowName != null) {
		merchantEntity.lastModifyShowName = lastModifyShowName;
	}
	final String? lastModifyTime = jsonConvert.convert<String>(json['lastModifyTime']);
	if (lastModifyTime != null) {
		merchantEntity.lastModifyTime = lastModifyTime;
	}
	final String? lastModifyUser = jsonConvert.convert<String>(json['lastModifyUser']);
	if (lastModifyUser != null) {
		merchantEntity.lastModifyUser = lastModifyUser;
	}
	final String? lastModifyUserName = jsonConvert.convert<String>(json['lastModifyUserName']);
	if (lastModifyUserName != null) {
		merchantEntity.lastModifyUserName = lastModifyUserName;
	}
	final String? latitude = jsonConvert.convert<String>(json['latitude']);
	if (latitude != null) {
		merchantEntity.latitude = latitude;
	}
	final String? legalPerson = jsonConvert.convert<String>(json['legalPerson']);
	if (legalPerson != null) {
		merchantEntity.legalPerson = legalPerson;
	}
	final String? legalPersonShow = jsonConvert.convert<String>(json['legalPersonShow']);
	if (legalPersonShow != null) {
		merchantEntity.legalPersonShow = legalPersonShow;
	}
	final String? legalPhone = jsonConvert.convert<String>(json['legalPhone']);
	if (legalPhone != null) {
		merchantEntity.legalPhone = legalPhone;
	}
	final String? legalPhoneShow = jsonConvert.convert<String>(json['legalPhoneShow']);
	if (legalPhoneShow != null) {
		merchantEntity.legalPhoneShow = legalPhoneShow;
	}
	final String? longitude = jsonConvert.convert<String>(json['longitude']);
	if (longitude != null) {
		merchantEntity.longitude = longitude;
	}
	final String? mcc = jsonConvert.convert<String>(json['mcc']);
	if (mcc != null) {
		merchantEntity.mcc = mcc;
	}
	final String? mccOne = jsonConvert.convert<String>(json['mccOne']);
	if (mccOne != null) {
		merchantEntity.mccOne = mccOne;
	}
	final String? mccTwo = jsonConvert.convert<String>(json['mccTwo']);
	if (mccTwo != null) {
		merchantEntity.mccTwo = mccTwo;
	}
	final String? merCode = jsonConvert.convert<String>(json['merCode']);
	if (merCode != null) {
		merchantEntity.merCode = merCode;
	}
	final String? merLevel = jsonConvert.convert<String>(json['merLevel']);
	if (merLevel != null) {
		merchantEntity.merLevel = merLevel;
	}
	final String? merName = jsonConvert.convert<String>(json['merName']);
	if (merName != null) {
		merchantEntity.merName = merName;
	}
	final String? merShortName = jsonConvert.convert<String>(json['merShortName']);
	if (merShortName != null) {
		merchantEntity.merShortName = merShortName;
	}
	final String? merType = jsonConvert.convert<String>(json['merType']);
	if (merType != null) {
		merchantEntity.merType = merType;
	}
	final double? orgGrade = jsonConvert.convert<double>(json['orgGrade']);
	if (orgGrade != null) {
		merchantEntity.orgGrade = orgGrade;
	}
	final String? orgNo = jsonConvert.convert<String>(json['orgNo']);
	if (orgNo != null) {
		merchantEntity.orgNo = orgNo;
	}
	final String? provCode = jsonConvert.convert<String>(json['provCode']);
	if (provCode != null) {
		merchantEntity.provCode = provCode;
	}
	final String? provName = jsonConvert.convert<String>(json['provName']);
	if (provName != null) {
		merchantEntity.provName = provName;
	}
	final String? proxyCode = jsonConvert.convert<String>(json['proxyCode']);
	if (proxyCode != null) {
		merchantEntity.proxyCode = proxyCode;
	}
	final String? proxyName = jsonConvert.convert<String>(json['proxyName']);
	if (proxyName != null) {
		merchantEntity.proxyName = proxyName;
	}
	final String? proxyType = jsonConvert.convert<String>(json['proxyType']);
	if (proxyType != null) {
		merchantEntity.proxyType = proxyType;
	}
	final String? registeCode = jsonConvert.convert<String>(json['registeCode']);
	if (registeCode != null) {
		merchantEntity.registeCode = registeCode;
	}
	final String? rtsStatus = jsonConvert.convert<String>(json['rtsStatus']);
	if (rtsStatus != null) {
		merchantEntity.rtsStatus = rtsStatus;
	}
	final String? rtsTime = jsonConvert.convert<String>(json['rtsTime']);
	if (rtsTime != null) {
		merchantEntity.rtsTime = rtsTime;
	}
	final double? serviceFee = jsonConvert.convert<double>(json['serviceFee']);
	if (serviceFee != null) {
		merchantEntity.serviceFee = serviceFee;
	}
	final String? shopName = jsonConvert.convert<String>(json['shopName']);
	if (shopName != null) {
		merchantEntity.shopName = shopName;
	}
	final String? xSource = jsonConvert.convert<String>(json['source']);
	if (xSource != null) {
		merchantEntity.xSource = xSource;
	}
	final String? termSerialNo = jsonConvert.convert<String>(json['termSerialNo']);
	if (termSerialNo != null) {
		merchantEntity.termSerialNo = termSerialNo;
	}
	final String? unionPayMerCode = jsonConvert.convert<String>(json['unionPayMerCode']);
	if (unionPayMerCode != null) {
		merchantEntity.unionPayMerCode = unionPayMerCode;
	}
	final String? unionpayAuditStatus = jsonConvert.convert<String>(json['unionpayAuditStatus']);
	if (unionpayAuditStatus != null) {
		merchantEntity.unionpayAuditStatus = unionpayAuditStatus;
	}
	final String? unionpayMerchantNo = jsonConvert.convert<String>(json['unionpayMerchantNo']);
	if (unionpayMerchantNo != null) {
		merchantEntity.unionpayMerchantNo = unionpayMerchantNo;
	}
	final String? useStatus = jsonConvert.convert<String>(json['useStatus']);
	if (useStatus != null) {
		merchantEntity.useStatus = useStatus;
	}
	final String? userId = jsonConvert.convert<String>(json['userId']);
	if (userId != null) {
		merchantEntity.userId = userId;
	}
	final String? verifyStatus = jsonConvert.convert<String>(json['verifyStatus']);
	if (verifyStatus != null) {
		merchantEntity.verifyStatus = verifyStatus;
	}
	final double? version = jsonConvert.convert<double>(json['version']);
	if (version != null) {
		merchantEntity.version = version;
	}
	return merchantEntity;
}

Map<String, dynamic> $MerchantEntityToJson(MerchantEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['activateTime'] = entity.activateTime;
	data['activatedStatus'] = entity.activatedStatus;
	data['addrDetail'] = entity.addrDetail;
	data['agentCode'] = entity.agentCode;
	data['allOrgNo'] = entity.allOrgNo;
	data['allSaleNo'] = entity.allSaleNo;
	data['auditRemark'] = entity.auditRemark;
	data['auditStatus'] = entity.auditStatus;
	data['auditTime'] = entity.auditTime;
	data['bankChannelId'] = entity.bankChannelId;
	data['bankNo'] = entity.bankNo;
	data['bindStatus'] = entity.bindStatus;
	data['bizScope'] = entity.bizScope;
	data['busLicenseEndTime'] = entity.busLicenseEndTime;
	data['busLicenseNo'] = entity.busLicenseNo;
	data['busLicenseStartTime'] = entity.busLicenseStartTime;
	data['channelMerchantNo'] = entity.channelMerchantNo;
	data['channelProxyNo'] = entity.channelProxyNo;
	data['cityCode'] = entity.cityCode;
	data['cityName'] = entity.cityName;
	data['contactorName'] = entity.contactorName;
	data['contactorNameShow'] = entity.contactorNameShow;
	data['contactorPhone'] = entity.contactorPhone;
	data['contactorPhoneShow'] = entity.contactorPhoneShow;
	data['createShowName'] = entity.createShowName;
	data['createTime'] = entity.createTime;
	data['createUser'] = entity.createUser;
	data['createUserName'] = entity.createUserName;
	data['csPhone'] = entity.csPhone;
	data['customMccType'] = entity.customMccType;
	data['customMerType'] = entity.customMerType;
	data['discountFlag'] = entity.discountFlag;
	data['distinctCode'] = entity.distinctCode;
	data['distinctName'] = entity.distinctName;
	data['docType'] = entity.docType;
	data['id'] = entity.id;
	data['idCardCode'] = entity.idCardCode;
	data['idCardCodeShow'] = entity.idCardCodeShow;
	data['idCardEndTime'] = entity.idCardEndTime;
	data['idCardStartTime'] = entity.idCardStartTime;
	data['inType'] = entity.inType;
	data['insResv3'] = entity.insResv3;
	data['invoiceName'] = entity.invoiceName;
	data['isOpenTwoFee'] = entity.isOpenTwoFee;
	data['isStandardMer'] = entity.isStandardMer;
	data['isUnionPayMer'] = entity.isUnionPayMer;
	data['lastModifyShowName'] = entity.lastModifyShowName;
	data['lastModifyTime'] = entity.lastModifyTime;
	data['lastModifyUser'] = entity.lastModifyUser;
	data['lastModifyUserName'] = entity.lastModifyUserName;
	data['latitude'] = entity.latitude;
	data['legalPerson'] = entity.legalPerson;
	data['legalPersonShow'] = entity.legalPersonShow;
	data['legalPhone'] = entity.legalPhone;
	data['legalPhoneShow'] = entity.legalPhoneShow;
	data['longitude'] = entity.longitude;
	data['mcc'] = entity.mcc;
	data['mccOne'] = entity.mccOne;
	data['mccTwo'] = entity.mccTwo;
	data['merCode'] = entity.merCode;
	data['merLevel'] = entity.merLevel;
	data['merName'] = entity.merName;
	data['merShortName'] = entity.merShortName;
	data['merType'] = entity.merType;
	data['orgGrade'] = entity.orgGrade;
	data['orgNo'] = entity.orgNo;
	data['provCode'] = entity.provCode;
	data['provName'] = entity.provName;
	data['proxyCode'] = entity.proxyCode;
	data['proxyName'] = entity.proxyName;
	data['proxyType'] = entity.proxyType;
	data['registeCode'] = entity.registeCode;
	data['rtsStatus'] = entity.rtsStatus;
	data['rtsTime'] = entity.rtsTime;
	data['serviceFee'] = entity.serviceFee;
	data['shopName'] = entity.shopName;
	data['source'] = entity.xSource;
	data['termSerialNo'] = entity.termSerialNo;
	data['unionPayMerCode'] = entity.unionPayMerCode;
	data['unionpayAuditStatus'] = entity.unionpayAuditStatus;
	data['unionpayMerchantNo'] = entity.unionpayMerchantNo;
	data['useStatus'] = entity.useStatus;
	data['userId'] = entity.userId;
	data['verifyStatus'] = entity.verifyStatus;
	data['version'] = entity.version;
	return data;
}