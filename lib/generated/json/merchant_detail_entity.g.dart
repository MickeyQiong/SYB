import 'package:leshua/generated/json/base/json_convert_content.dart';
import 'package:leshua/model/merchant_detail_entity.dart';

MerchantDetailEntity $MerchantDetailEntityFromJson(Map<String, dynamic> json) {
	final MerchantDetailEntity merchantDetailEntity = MerchantDetailEntity();
	final MerchantDetailCacheMerchantInfo? cacheMerchantInfo = jsonConvert.convert<MerchantDetailCacheMerchantInfo>(json['cacheMerchantInfo']);
	if (cacheMerchantInfo != null) {
		merchantDetailEntity.cacheMerchantInfo = cacheMerchantInfo;
	}
	final bool canRegister = jsonConvert.convert<bool>(json['canRegister']) ?? false;
	merchantDetailEntity.canRegister = canRegister;

	final List<MerchantDetailMerchantInfo>? merchantInfo = jsonConvert.convertListNotNull<MerchantDetailMerchantInfo>(json['merchantInfo']);
	if (merchantInfo != null) {
		merchantDetailEntity.merchantInfo = merchantInfo;
	}
	return merchantDetailEntity;
}

Map<String, dynamic> $MerchantDetailEntityToJson(MerchantDetailEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['cacheMerchantInfo'] = entity.cacheMerchantInfo?.toJson();
	data['canRegister'] = entity.canRegister;
	data['merchantInfo'] =  entity.merchantInfo?.map((v) => v.toJson()).toList();
	return data;
}

MerchantDetailCacheMerchantInfo $MerchantDetailCacheMerchantInfoFromJson(Map<String, dynamic> json) {
	final MerchantDetailCacheMerchantInfo merchantDetailCacheMerchantInfo = MerchantDetailCacheMerchantInfo();
	final MerchantDetailCacheMerchantInfoMerInfoBaseTempVO? merInfoBaseTempVO = jsonConvert.convert<MerchantDetailCacheMerchantInfoMerInfoBaseTempVO>(json['merInfoBaseTempVO']);
	if (merInfoBaseTempVO != null) {
		merchantDetailCacheMerchantInfo.merInfoBaseTempVO = merInfoBaseTempVO;
	}
	final MerchantDetailCacheMerchantInfoMerSettleInfoTempVO? merSettleInfoTempVO = jsonConvert.convert<MerchantDetailCacheMerchantInfoMerSettleInfoTempVO>(json['merSettleInfoTempVO']);
	if (merSettleInfoTempVO != null) {
		merchantDetailCacheMerchantInfo.merSettleInfoTempVO = merSettleInfoTempVO;
	}
	final MerchantDetailCacheMerchantInfoMerchantContactTempInfoVO? merchantContactTempInfoVO = jsonConvert.convert<MerchantDetailCacheMerchantInfoMerchantContactTempInfoVO>(json['merchantContactTempInfoVO']);
	if (merchantContactTempInfoVO != null) {
		merchantDetailCacheMerchantInfo.merchantContactTempInfoVO = merchantContactTempInfoVO;
	}
	final int? step = jsonConvert.convert<int>(json['step']);
	if (step != null) {
		merchantDetailCacheMerchantInfo.step = step;
	}
	return merchantDetailCacheMerchantInfo;
}

Map<String, dynamic> $MerchantDetailCacheMerchantInfoToJson(MerchantDetailCacheMerchantInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['merInfoBaseTempVO'] = entity.merInfoBaseTempVO?.toJson();
	data['merSettleInfoTempVO'] = entity.merSettleInfoTempVO?.toJson();
	data['merchantContactTempInfoVO'] = entity.merchantContactTempInfoVO?.toJson();
	data['step'] = entity.step;
	return data;
}

MerchantDetailCacheMerchantInfoMerInfoBaseTempVO $MerchantDetailCacheMerchantInfoMerInfoBaseTempVOFromJson(Map<String, dynamic> json) {
	final MerchantDetailCacheMerchantInfoMerInfoBaseTempVO merchantDetailCacheMerchantInfoMerInfoBaseTempVO = MerchantDetailCacheMerchantInfoMerInfoBaseTempVO();
	final String? auditRemark = jsonConvert.convert<String>(json['auditRemark']);
	if (auditRemark != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.auditRemark = auditRemark;
	}
	final String? auditStatus = jsonConvert.convert<String>(json['auditStatus']);
	if (auditStatus != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.auditStatus = auditStatus;
	}
	final String? auditTime = jsonConvert.convert<String>(json['auditTime']);
	if (auditTime != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.auditTime = auditTime;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.createTime = createTime;
	}
	final String? docType = jsonConvert.convert<String>(json['docType']);
	if (docType != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.docType = docType;
	}
	final String? idCardBackPicUrl = jsonConvert.convert<String>(json['idCardBackPicUrl']);
	if (idCardBackPicUrl != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.idCardBackPicUrl = idCardBackPicUrl;
	}
	final String? idCardCode = jsonConvert.convert<String>(json['idCardCode']);
	if (idCardCode != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.idCardCode = idCardCode;
	}
	final String? idCardEndTime = jsonConvert.convert<String>(json['idCardEndTime']);
	if (idCardEndTime != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.idCardEndTime = idCardEndTime;
	}
	final String? idCardFrontPicUrl = jsonConvert.convert<String>(json['idCardFrontPicUrl']);
	if (idCardFrontPicUrl != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.idCardFrontPicUrl = idCardFrontPicUrl;
	}
	final String? idCardStartTime = jsonConvert.convert<String>(json['idCardStartTime']);
	if (idCardStartTime != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.idCardStartTime = idCardStartTime;
	}
	final String? idcardHandPicUrl = jsonConvert.convert<String>(json['idcardHandPicUrl']);
	if (idcardHandPicUrl != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.idcardHandPicUrl = idcardHandPicUrl;
	}
	final String? legalPerson = jsonConvert.convert<String>(json['legalPerson']);
	if (legalPerson != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.legalPerson = legalPerson;
	}
	final String? legalPhone = jsonConvert.convert<String>(json['legalPhone']);
	if (legalPhone != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.legalPhone = legalPhone;
	}
	final String? mcc = jsonConvert.convert<String>(json['mcc']);
	if (mcc != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.mcc = mcc;
	}
	final String? merCode = jsonConvert.convert<String>(json['merCode']);
	if (merCode != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.merCode = merCode;
	}
	final String? merName = jsonConvert.convert<String>(json['merName']);
	if (merName != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.merName = merName;
	}
	final String? merShortName = jsonConvert.convert<String>(json['merShortName']);
	if (merShortName != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.merShortName = merShortName;
	}
	final String? merType = jsonConvert.convert<String>(json['merType']);
	if (merType != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.merType = merType;
	}
	final String? useStatus = jsonConvert.convert<String>(json['useStatus']);
	if (useStatus != null) {
		merchantDetailCacheMerchantInfoMerInfoBaseTempVO.useStatus = useStatus;
	}
	return merchantDetailCacheMerchantInfoMerInfoBaseTempVO;
}

Map<String, dynamic> $MerchantDetailCacheMerchantInfoMerInfoBaseTempVOToJson(MerchantDetailCacheMerchantInfoMerInfoBaseTempVO entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['auditRemark'] = entity.auditRemark;
	data['auditStatus'] = entity.auditStatus;
	data['auditTime'] = entity.auditTime;
	data['createTime'] = entity.createTime;
	data['docType'] = entity.docType;
	data['idCardBackPicUrl'] = entity.idCardBackPicUrl;
	data['idCardCode'] = entity.idCardCode;
	data['idCardEndTime'] = entity.idCardEndTime;
	data['idCardFrontPicUrl'] = entity.idCardFrontPicUrl;
	data['idCardStartTime'] = entity.idCardStartTime;
	data['idcardHandPicUrl'] = entity.idcardHandPicUrl;
	data['legalPerson'] = entity.legalPerson;
	data['legalPhone'] = entity.legalPhone;
	data['mcc'] = entity.mcc;
	data['merCode'] = entity.merCode;
	data['merName'] = entity.merName;
	data['merShortName'] = entity.merShortName;
	data['merType'] = entity.merType;
	data['useStatus'] = entity.useStatus;
	return data;
}

MerchantDetailCacheMerchantInfoMerSettleInfoTempVO $MerchantDetailCacheMerchantInfoMerSettleInfoTempVOFromJson(Map<String, dynamic> json) {
	final MerchantDetailCacheMerchantInfoMerSettleInfoTempVO merchantDetailCacheMerchantInfoMerSettleInfoTempVO = MerchantDetailCacheMerchantInfoMerSettleInfoTempVO();
	final String? accLevel = jsonConvert.convert<String>(json['accLevel']);
	if (accLevel != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.accLevel = accLevel;
	}
	final String? accName = jsonConvert.convert<String>(json['accName']);
	if (accName != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.accName = accName;
	}
	final String? accNum = jsonConvert.convert<String>(json['accNum']);
	if (accNum != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.accNum = accNum;
	}
	final String? bankCardPicUrl = jsonConvert.convert<String>(json['bankCardPicUrl']);
	if (bankCardPicUrl != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.bankCardPicUrl = bankCardPicUrl;
	}
	final String? bankCityCode = jsonConvert.convert<String>(json['bankCityCode']);
	if (bankCityCode != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.bankCityCode = bankCityCode;
	}
	final String? bankCityName = jsonConvert.convert<String>(json['bankCityName']);
	if (bankCityName != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.bankCityName = bankCityName;
	}
	final String? bankCode = jsonConvert.convert<String>(json['bankCode']);
	if (bankCode != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.bankCode = bankCode;
	}
	final String? bankName = jsonConvert.convert<String>(json['bankName']);
	if (bankName != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.bankName = bankName;
	}
	final String? bankNameBranch = jsonConvert.convert<String>(json['bankNameBranch']);
	if (bankNameBranch != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.bankNameBranch = bankNameBranch;
	}
	final String? bankProvCode = jsonConvert.convert<String>(json['bankProvCode']);
	if (bankProvCode != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.bankProvCode = bankProvCode;
	}
	final String? bankProvName = jsonConvert.convert<String>(json['bankProvName']);
	if (bankProvName != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.bankProvName = bankProvName;
	}
	final String? branchCode = jsonConvert.convert<String>(json['branchCode']);
	if (branchCode != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.branchCode = branchCode;
	}
	final String? linkNo = jsonConvert.convert<String>(json['linkNo']);
	if (linkNo != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.linkNo = linkNo;
	}
	final String? phone = jsonConvert.convert<String>(json['phone']);
	if (phone != null) {
		merchantDetailCacheMerchantInfoMerSettleInfoTempVO.phone = phone;
	}
	return merchantDetailCacheMerchantInfoMerSettleInfoTempVO;
}

Map<String, dynamic> $MerchantDetailCacheMerchantInfoMerSettleInfoTempVOToJson(MerchantDetailCacheMerchantInfoMerSettleInfoTempVO entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['accLevel'] = entity.accLevel;
	data['accName'] = entity.accName;
	data['accNum'] = entity.accNum;
	data['bankCardPicUrl'] = entity.bankCardPicUrl;
	data['bankCityCode'] = entity.bankCityCode;
	data['bankCityName'] = entity.bankCityName;
	data['bankCode'] = entity.bankCode;
	data['bankName'] = entity.bankName;
	data['bankNameBranch'] = entity.bankNameBranch;
	data['bankProvCode'] = entity.bankProvCode;
	data['bankProvName'] = entity.bankProvName;
	data['branchCode'] = entity.branchCode;
	data['linkNo'] = entity.linkNo;
	data['phone'] = entity.phone;
	return data;
}

MerchantDetailCacheMerchantInfoMerchantContactTempInfoVO $MerchantDetailCacheMerchantInfoMerchantContactTempInfoVOFromJson(Map<String, dynamic> json) {
	final MerchantDetailCacheMerchantInfoMerchantContactTempInfoVO merchantDetailCacheMerchantInfoMerchantContactTempInfoVO = MerchantDetailCacheMerchantInfoMerchantContactTempInfoVO();
	final String? addrDetail = jsonConvert.convert<String>(json['addrDetail']);
	if (addrDetail != null) {
		merchantDetailCacheMerchantInfoMerchantContactTempInfoVO.addrDetail = addrDetail;
	}
	final String? cityCode = jsonConvert.convert<String>(json['cityCode']);
	if (cityCode != null) {
		merchantDetailCacheMerchantInfoMerchantContactTempInfoVO.cityCode = cityCode;
	}
	final String? contactorPhone = jsonConvert.convert<String>(json['contactorPhone']);
	if (contactorPhone != null) {
		merchantDetailCacheMerchantInfoMerchantContactTempInfoVO.contactorPhone = contactorPhone;
	}
	final String? csPhone = jsonConvert.convert<String>(json['csPhone']);
	if (csPhone != null) {
		merchantDetailCacheMerchantInfoMerchantContactTempInfoVO.csPhone = csPhone;
	}
	final String? distinctCode = jsonConvert.convert<String>(json['distinctCode']);
	if (distinctCode != null) {
		merchantDetailCacheMerchantInfoMerchantContactTempInfoVO.distinctCode = distinctCode;
	}
	final String? provCode = jsonConvert.convert<String>(json['provCode']);
	if (provCode != null) {
		merchantDetailCacheMerchantInfoMerchantContactTempInfoVO.provCode = provCode;
	}
	return merchantDetailCacheMerchantInfoMerchantContactTempInfoVO;
}

Map<String, dynamic> $MerchantDetailCacheMerchantInfoMerchantContactTempInfoVOToJson(MerchantDetailCacheMerchantInfoMerchantContactTempInfoVO entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['addrDetail'] = entity.addrDetail;
	data['cityCode'] = entity.cityCode;
	data['contactorPhone'] = entity.contactorPhone;
	data['csPhone'] = entity.csPhone;
	data['distinctCode'] = entity.distinctCode;
	data['provCode'] = entity.provCode;
	return data;
}

MerchantDetailMerchantInfo $MerchantDetailMerchantInfoFromJson(Map<String, dynamic> json) {
	final MerchantDetailMerchantInfo merchantDetailMerchantInfo = MerchantDetailMerchantInfo();
	final String? merCode = jsonConvert.convert<String>(json['merCode']);
	if (merCode != null) {
		merchantDetailMerchantInfo.merCode = merCode;
	}
	final MerchantDetailMerchantInfoMerInfoBaseTempVO? merInfoBaseTempVO = jsonConvert.convert<MerchantDetailMerchantInfoMerInfoBaseTempVO>(json['merInfoBaseTempVO']);
	if (merInfoBaseTempVO != null) {
		merchantDetailMerchantInfo.merInfoBaseTempVO = merInfoBaseTempVO;
	}
	final MerchantDetailMerchantInfoMerSettleInfoTempVO? merSettleInfoTempVO = jsonConvert.convert<MerchantDetailMerchantInfoMerSettleInfoTempVO>(json['merSettleInfoTempVO']);
	if (merSettleInfoTempVO != null) {
		merchantDetailMerchantInfo.merSettleInfoTempVO = merSettleInfoTempVO;
	}
	final MerchantDetailMerchantInfoMerchantContactTempInfoVO? merchantContactTempInfoVO = jsonConvert.convert<MerchantDetailMerchantInfoMerchantContactTempInfoVO>(json['merchantContactTempInfoVO']);
	if (merchantContactTempInfoVO != null) {
		merchantDetailMerchantInfo.merchantContactTempInfoVO = merchantContactTempInfoVO;
	}
	return merchantDetailMerchantInfo;
}

Map<String, dynamic> $MerchantDetailMerchantInfoToJson(MerchantDetailMerchantInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['merCode'] = entity.merCode;
	data['merInfoBaseTempVO'] = entity.merInfoBaseTempVO?.toJson();
	data['merSettleInfoTempVO'] = entity.merSettleInfoTempVO?.toJson();
	data['merchantContactTempInfoVO'] = entity.merchantContactTempInfoVO?.toJson();
	return data;
}

MerchantDetailMerchantInfoMerInfoBaseTempVO $MerchantDetailMerchantInfoMerInfoBaseTempVOFromJson(Map<String, dynamic> json) {
	final MerchantDetailMerchantInfoMerInfoBaseTempVO merchantDetailMerchantInfoMerInfoBaseTempVO = MerchantDetailMerchantInfoMerInfoBaseTempVO();
	final String? auditRemark = jsonConvert.convert<String>(json['auditRemark']);
	if (auditRemark != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.auditRemark = auditRemark;
	}
	final String? auditStatus = jsonConvert.convert<String>(json['auditStatus']);
	if (auditStatus != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.auditStatus = auditStatus;
	}
	final String? auditTime = jsonConvert.convert<String>(json['auditTime']);
	if (auditTime != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.auditTime = auditTime;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.createTime = createTime;
	}
	final String? docType = jsonConvert.convert<String>(json['docType']);
	if (docType != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.docType = docType;
	}
	final String? idCardBackPicUrl = jsonConvert.convert<String>(json['idCardBackPicUrl']);
	if (idCardBackPicUrl != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.idCardBackPicUrl = idCardBackPicUrl;
	}
	final String? idCardCode = jsonConvert.convert<String>(json['idCardCode']);
	if (idCardCode != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.idCardCode = idCardCode;
	}
	final String? idCardEndTime = jsonConvert.convert<String>(json['idCardEndTime']);
	if (idCardEndTime != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.idCardEndTime = idCardEndTime;
	}
	final String? idCardFrontPicUrl = jsonConvert.convert<String>(json['idCardFrontPicUrl']);
	if (idCardFrontPicUrl != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.idCardFrontPicUrl = idCardFrontPicUrl;
	}
	final String? idCardStartTime = jsonConvert.convert<String>(json['idCardStartTime']);
	if (idCardStartTime != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.idCardStartTime = idCardStartTime;
	}
	final String? idcardHandPicUrl = jsonConvert.convert<String>(json['idcardHandPicUrl']);
	if (idcardHandPicUrl != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.idcardHandPicUrl = idcardHandPicUrl;
	}
	final String? legalPerson = jsonConvert.convert<String>(json['legalPerson']);
	if (legalPerson != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.legalPerson = legalPerson;
	}
	final String? legalPhone = jsonConvert.convert<String>(json['legalPhone']);
	if (legalPhone != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.legalPhone = legalPhone;
	}
	final String? mcc = jsonConvert.convert<String>(json['mcc']);
	if (mcc != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.mcc = mcc;
	}
	final String? merCode = jsonConvert.convert<String>(json['merCode']);
	if (merCode != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.merCode = merCode;
	}
	final String? merName = jsonConvert.convert<String>(json['merName']);
	if (merName != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.merName = merName;
	}
	final String? merShortName = jsonConvert.convert<String>(json['merShortName']);
	if (merShortName != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.merShortName = merShortName;
	}
	final String? merType = jsonConvert.convert<String>(json['merType']);
	if (merType != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.merType = merType;
	}
	final String? useStatus = jsonConvert.convert<String>(json['useStatus']);
	if (useStatus != null) {
		merchantDetailMerchantInfoMerInfoBaseTempVO.useStatus = useStatus;
	}
	return merchantDetailMerchantInfoMerInfoBaseTempVO;
}

Map<String, dynamic> $MerchantDetailMerchantInfoMerInfoBaseTempVOToJson(MerchantDetailMerchantInfoMerInfoBaseTempVO entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['auditRemark'] = entity.auditRemark;
	data['auditStatus'] = entity.auditStatus;
	data['auditTime'] = entity.auditTime;
	data['createTime'] = entity.createTime;
	data['docType'] = entity.docType;
	data['idCardBackPicUrl'] = entity.idCardBackPicUrl;
	data['idCardCode'] = entity.idCardCode;
	data['idCardEndTime'] = entity.idCardEndTime;
	data['idCardFrontPicUrl'] = entity.idCardFrontPicUrl;
	data['idCardStartTime'] = entity.idCardStartTime;
	data['idcardHandPicUrl'] = entity.idcardHandPicUrl;
	data['legalPerson'] = entity.legalPerson;
	data['legalPhone'] = entity.legalPhone;
	data['mcc'] = entity.mcc;
	data['merCode'] = entity.merCode;
	data['merName'] = entity.merName;
	data['merShortName'] = entity.merShortName;
	data['merType'] = entity.merType;
	data['useStatus'] = entity.useStatus;
	return data;
}

MerchantDetailMerchantInfoMerSettleInfoTempVO $MerchantDetailMerchantInfoMerSettleInfoTempVOFromJson(Map<String, dynamic> json) {
	final MerchantDetailMerchantInfoMerSettleInfoTempVO merchantDetailMerchantInfoMerSettleInfoTempVO = MerchantDetailMerchantInfoMerSettleInfoTempVO();
	final String? accLevel = jsonConvert.convert<String>(json['accLevel']);
	if (accLevel != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.accLevel = accLevel;
	}
	final String? accName = jsonConvert.convert<String>(json['accName']);
	if (accName != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.accName = accName;
	}
	final String? accNum = jsonConvert.convert<String>(json['accNum']);
	if (accNum != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.accNum = accNum;
	}
	final String? bankCardPicUrl = jsonConvert.convert<String>(json['bankCardPicUrl']);
	if (bankCardPicUrl != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.bankCardPicUrl = bankCardPicUrl;
	}
	final String? bankCityCode = jsonConvert.convert<String>(json['bankCityCode']);
	if (bankCityCode != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.bankCityCode = bankCityCode;
	}
	final String? bankCityName = jsonConvert.convert<String>(json['bankCityName']);
	if (bankCityName != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.bankCityName = bankCityName;
	}
	final String? bankCode = jsonConvert.convert<String>(json['bankCode']);
	if (bankCode != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.bankCode = bankCode;
	}
	final String? bankName = jsonConvert.convert<String>(json['bankName']);
	if (bankName != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.bankName = bankName;
	}
	final String? bankNameBranch = jsonConvert.convert<String>(json['bankNameBranch']);
	if (bankNameBranch != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.bankNameBranch = bankNameBranch;
	}
	final String? bankProvCode = jsonConvert.convert<String>(json['bankProvCode']);
	if (bankProvCode != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.bankProvCode = bankProvCode;
	}
	final String? bankProvName = jsonConvert.convert<String>(json['bankProvName']);
	if (bankProvName != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.bankProvName = bankProvName;
	}
	final String? branchCode = jsonConvert.convert<String>(json['branchCode']);
	if (branchCode != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.branchCode = branchCode;
	}
	final String? linkNo = jsonConvert.convert<String>(json['linkNo']);
	if (linkNo != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.linkNo = linkNo;
	}
	final String? phone = jsonConvert.convert<String>(json['phone']);
	if (phone != null) {
		merchantDetailMerchantInfoMerSettleInfoTempVO.phone = phone;
	}
	return merchantDetailMerchantInfoMerSettleInfoTempVO;
}

Map<String, dynamic> $MerchantDetailMerchantInfoMerSettleInfoTempVOToJson(MerchantDetailMerchantInfoMerSettleInfoTempVO entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['accLevel'] = entity.accLevel;
	data['accName'] = entity.accName;
	data['accNum'] = entity.accNum;
	data['bankCardPicUrl'] = entity.bankCardPicUrl;
	data['bankCityCode'] = entity.bankCityCode;
	data['bankCityName'] = entity.bankCityName;
	data['bankCode'] = entity.bankCode;
	data['bankName'] = entity.bankName;
	data['bankNameBranch'] = entity.bankNameBranch;
	data['bankProvCode'] = entity.bankProvCode;
	data['bankProvName'] = entity.bankProvName;
	data['branchCode'] = entity.branchCode;
	data['linkNo'] = entity.linkNo;
	data['phone'] = entity.phone;
	return data;
}

MerchantDetailMerchantInfoMerchantContactTempInfoVO $MerchantDetailMerchantInfoMerchantContactTempInfoVOFromJson(Map<String, dynamic> json) {
	final MerchantDetailMerchantInfoMerchantContactTempInfoVO merchantDetailMerchantInfoMerchantContactTempInfoVO = MerchantDetailMerchantInfoMerchantContactTempInfoVO();
	final String? addrDetail = jsonConvert.convert<String>(json['addrDetail']);
	if (addrDetail != null) {
		merchantDetailMerchantInfoMerchantContactTempInfoVO.addrDetail = addrDetail;
	}
	final String? cityCode = jsonConvert.convert<String>(json['cityCode']);
	if (cityCode != null) {
		merchantDetailMerchantInfoMerchantContactTempInfoVO.cityCode = cityCode;
	}
	final String? contactorPhone = jsonConvert.convert<String>(json['contactorPhone']);
	if (contactorPhone != null) {
		merchantDetailMerchantInfoMerchantContactTempInfoVO.contactorPhone = contactorPhone;
	}
	final String? csPhone = jsonConvert.convert<String>(json['csPhone']);
	if (csPhone != null) {
		merchantDetailMerchantInfoMerchantContactTempInfoVO.csPhone = csPhone;
	}
	final String? distinctCode = jsonConvert.convert<String>(json['distinctCode']);
	if (distinctCode != null) {
		merchantDetailMerchantInfoMerchantContactTempInfoVO.distinctCode = distinctCode;
	}
	final String? provCode = jsonConvert.convert<String>(json['provCode']);
	if (provCode != null) {
		merchantDetailMerchantInfoMerchantContactTempInfoVO.provCode = provCode;
	}
	return merchantDetailMerchantInfoMerchantContactTempInfoVO;
}

Map<String, dynamic> $MerchantDetailMerchantInfoMerchantContactTempInfoVOToJson(MerchantDetailMerchantInfoMerchantContactTempInfoVO entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['addrDetail'] = entity.addrDetail;
	data['cityCode'] = entity.cityCode;
	data['contactorPhone'] = entity.contactorPhone;
	data['csPhone'] = entity.csPhone;
	data['distinctCode'] = entity.distinctCode;
	data['provCode'] = entity.provCode;
	return data;
}