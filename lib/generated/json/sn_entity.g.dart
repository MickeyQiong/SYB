import 'package:leshua/generated/json/base/json_convert_content.dart';
import 'package:leshua/model/sn_entity.dart';

SnEntity $SnEntityFromJson(Map<String, dynamic> json) {
	final SnEntity snEntity = SnEntity();
	final String? activateTime = jsonConvert.convert<String>(json['activateTime']);
	if (activateTime != null) {
		snEntity.activateTime = activateTime;
	}
	final String? activatedStatus = jsonConvert.convert<String>(json['activatedStatus']);
	if (activatedStatus != null) {
		snEntity.activatedStatus = activatedStatus;
	}
	final double? adjustFee = jsonConvert.convert<double>(json['adjustFee']);
	if (adjustFee != null) {
		snEntity.adjustFee = adjustFee;
	}
	final String? adjustFeeExecuteTime = jsonConvert.convert<String>(json['adjustFeeExecuteTime']);
	if (adjustFeeExecuteTime != null) {
		snEntity.adjustFeeExecuteTime = adjustFeeExecuteTime;
	}
	final String? allOrgNo = jsonConvert.convert<String>(json['allOrgNo']);
	if (allOrgNo != null) {
		snEntity.allOrgNo = allOrgNo;
	}
	final String? allSaleNo = jsonConvert.convert<String>(json['allSaleNo']);
	if (allSaleNo != null) {
		snEntity.allSaleNo = allSaleNo;
	}
	final String? bindAgentTime = jsonConvert.convert<String>(json['bindAgentTime']);
	if (bindAgentTime != null) {
		snEntity.bindAgentTime = bindAgentTime;
	}
	final String? bindMercTime = jsonConvert.convert<String>(json['bindMercTime']);
	if (bindMercTime != null) {
		snEntity.bindMercTime = bindMercTime;
	}
	final String? bindStatus = jsonConvert.convert<String>(json['bindStatus']);
	if (bindStatus != null) {
		snEntity.bindStatus = bindStatus;
	}
	final String? branchNum = jsonConvert.convert<String>(json['branchNum']);
	if (branchNum != null) {
		snEntity.branchNum = branchNum;
	}
	final String? createShowName = jsonConvert.convert<String>(json['createShowName']);
	if (createShowName != null) {
		snEntity.createShowName = createShowName;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		snEntity.createTime = createTime;
	}
	final String? createUser = jsonConvert.convert<String>(json['createUser']);
	if (createUser != null) {
		snEntity.createUser = createUser;
	}
	final String? createUserName = jsonConvert.convert<String>(json['createUserName']);
	if (createUserName != null) {
		snEntity.createUserName = createUserName;
	}
	final String? execPolicyCode = jsonConvert.convert<String>(json['execPolicyCode']);
	if (execPolicyCode != null) {
		snEntity.execPolicyCode = execPolicyCode;
	}
	final String? execSubPolicyCode = jsonConvert.convert<String>(json['execSubPolicyCode']);
	if (execSubPolicyCode != null) {
		snEntity.execSubPolicyCode = execSubPolicyCode;
	}
	final String? feeContent = jsonConvert.convert<String>(json['feeContent']);
	if (feeContent != null) {
		snEntity.feeContent = feeContent;
	}
	final String? feeRatePLAdjust = jsonConvert.convert<String>(json['feeRatePLAdjust']);
	if (feeRatePLAdjust != null) {
		snEntity.feeRatePLAdjust = feeRatePLAdjust;
	}
	final String? feeType = jsonConvert.convert<String>(json['feeType']);
	if (feeType != null) {
		snEntity.feeType = feeType;
	}
	final String? firstOrderTime = jsonConvert.convert<String>(json['firstOrderTime']);
	if (firstOrderTime != null) {
		snEntity.firstOrderTime = firstOrderTime;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		snEntity.id = id;
	}
	final String? importBatchNo = jsonConvert.convert<String>(json['importBatchNo']);
	if (importBatchNo != null) {
		snEntity.importBatchNo = importBatchNo;
	}
	final double? inPrice = jsonConvert.convert<double>(json['inPrice']);
	if (inPrice != null) {
		snEntity.inPrice = inPrice;
	}
	final String? isEncrypt = jsonConvert.convert<String>(json['isEncrypt']);
	if (isEncrypt != null) {
		snEntity.isEncrypt = isEncrypt;
	}
	final String? isQualified = jsonConvert.convert<String>(json['isQualified']);
	if (isQualified != null) {
		snEntity.isQualified = isQualified;
	}
	final String? justTradeMachine = jsonConvert.convert<String>(json['justTradeMachine']);
	if (justTradeMachine != null) {
		snEntity.justTradeMachine = justTradeMachine;
	}
	final String? lastGoalStatus = jsonConvert.convert<String>(json['lastGoalStatus']);
	if (lastGoalStatus != null) {
		snEntity.lastGoalStatus = lastGoalStatus;
	}
	final String? lastGoalTime = jsonConvert.convert<String>(json['lastGoalTime']);
	if (lastGoalTime != null) {
		snEntity.lastGoalTime = lastGoalTime;
	}
	final String? lastModifyShowName = jsonConvert.convert<String>(json['lastModifyShowName']);
	if (lastModifyShowName != null) {
		snEntity.lastModifyShowName = lastModifyShowName;
	}
	final String? lastModifyTime = jsonConvert.convert<String>(json['lastModifyTime']);
	if (lastModifyTime != null) {
		snEntity.lastModifyTime = lastModifyTime;
	}
	final String? lastModifyUser = jsonConvert.convert<String>(json['lastModifyUser']);
	if (lastModifyUser != null) {
		snEntity.lastModifyUser = lastModifyUser;
	}
	final String? lastModifyUserName = jsonConvert.convert<String>(json['lastModifyUserName']);
	if (lastModifyUserName != null) {
		snEntity.lastModifyUserName = lastModifyUserName;
	}
	final String? lockMerFee = jsonConvert.convert<String>(json['lockMerFee']);
	if (lockMerFee != null) {
		snEntity.lockMerFee = lockMerFee;
	}
	final String? lockModifyMerFee = jsonConvert.convert<String>(json['lockModifyMerFee']);
	if (lockModifyMerFee != null) {
		snEntity.lockModifyMerFee = lockModifyMerFee;
	}
	final String? manufacturerName = jsonConvert.convert<String>(json['manufacturerName']);
	if (manufacturerName != null) {
		snEntity.manufacturerName = manufacturerName;
	}
	final String? manufacturerNo = jsonConvert.convert<String>(json['manufacturerNo']);
	if (manufacturerNo != null) {
		snEntity.manufacturerNo = manufacturerNo;
	}
	final String? merCode = jsonConvert.convert<String>(json['merCode']);
	if (merCode != null) {
		snEntity.merCode = merCode;
	}
	final String? merName = jsonConvert.convert<String>(json['merName']);
	if (merName != null) {
		snEntity.merName = merName;
	}
	final String? merShortName = jsonConvert.convert<String>(json['merShortName']);
	if (merShortName != null) {
		snEntity.merShortName = merShortName;
	}
	final String? modelName = jsonConvert.convert<String>(json['modelName']);
	if (modelName != null) {
		snEntity.modelName = modelName;
	}
	final String? modelNo = jsonConvert.convert<String>(json['modelNo']);
	if (modelNo != null) {
		snEntity.modelNo = modelNo;
	}
	final String? modelStatus = jsonConvert.convert<String>(json['modelStatus']);
	if (modelStatus != null) {
		snEntity.modelStatus = modelStatus;
	}
	final double? orgGrade = jsonConvert.convert<double>(json['orgGrade']);
	if (orgGrade != null) {
		snEntity.orgGrade = orgGrade;
	}
	final String? orgNo = jsonConvert.convert<String>(json['orgNo']);
	if (orgNo != null) {
		snEntity.orgNo = orgNo;
	}
	final double? outPrice = jsonConvert.convert<double>(json['outPrice']);
	if (outPrice != null) {
		snEntity.outPrice = outPrice;
	}
	final String? payCode = jsonConvert.convert<String>(json['payCode']);
	if (payCode != null) {
		snEntity.payCode = payCode;
	}
	final String? payPolicyCode = jsonConvert.convert<String>(json['payPolicyCode']);
	if (payPolicyCode != null) {
		snEntity.payPolicyCode = payPolicyCode;
	}
	final String? paySubPolicyCode = jsonConvert.convert<String>(json['paySubPolicyCode']);
	if (paySubPolicyCode != null) {
		snEntity.paySubPolicyCode = paySubPolicyCode;
	}
	final String? processStatus = jsonConvert.convert<String>(json['processStatus']);
	if (processStatus != null) {
		snEntity.processStatus = processStatus;
	}
	final String? productCode = jsonConvert.convert<String>(json['productCode']);
	if (productCode != null) {
		snEntity.productCode = productCode;
	}
	final String? productName = jsonConvert.convert<String>(json['productName']);
	if (productName != null) {
		snEntity.productName = productName;
	}
	final String? proxyCode = jsonConvert.convert<String>(json['proxyCode']);
	if (proxyCode != null) {
		snEntity.proxyCode = proxyCode;
	}
	final String? proxyName = jsonConvert.convert<String>(json['proxyName']);
	if (proxyName != null) {
		snEntity.proxyName = proxyName;
	}
	final String? saleNo = jsonConvert.convert<String>(json['saleNo']);
	if (saleNo != null) {
		snEntity.saleNo = saleNo;
	}
	final String? servciceFeeCharged = jsonConvert.convert<String>(json['servciceFeeCharged']);
	if (servciceFeeCharged != null) {
		snEntity.servciceFeeCharged = servciceFeeCharged;
	}
	final double? serviceFee = jsonConvert.convert<double>(json['serviceFee']);
	if (serviceFee != null) {
		snEntity.serviceFee = serviceFee;
	}
	final String? serviceFeeCashBackStatus = jsonConvert.convert<String>(json['serviceFeeCashBackStatus']);
	if (serviceFeeCashBackStatus != null) {
		snEntity.serviceFeeCashBackStatus = serviceFeeCashBackStatus;
	}
	final double? simcardFee = jsonConvert.convert<double>(json['simcardFee']);
	if (simcardFee != null) {
		snEntity.simcardFee = simcardFee;
	}
	final String? simcardFeeCharged = jsonConvert.convert<String>(json['simcardFeeCharged']);
	if (simcardFeeCharged != null) {
		snEntity.simcardFeeCharged = simcardFeeCharged;
	}
	final double? simcardFeeChargedNum = jsonConvert.convert<double>(json['simcardFeeChargedNum']);
	if (simcardFeeChargedNum != null) {
		snEntity.simcardFeeChargedNum = simcardFeeChargedNum;
	}
	final String? simcardFeeChargedTime = jsonConvert.convert<String>(json['simcardFeeChargedTime']);
	if (simcardFeeChargedTime != null) {
		snEntity.simcardFeeChargedTime = simcardFeeChargedTime;
	}
	final String? xSource = jsonConvert.convert<String>(json['source']);
	if (xSource != null) {
		snEntity.xSource = xSource;
	}
	final String? tels = jsonConvert.convert<String>(json['tels']);
	if (tels != null) {
		snEntity.tels = tels;
	}
	final String? termCode = jsonConvert.convert<String>(json['termCode']);
	if (termCode != null) {
		snEntity.termCode = termCode;
	}
	final String? termNo = jsonConvert.convert<String>(json['termNo']);
	if (termNo != null) {
		snEntity.termNo = termNo;
	}
	final String? termSerialNo = jsonConvert.convert<String>(json['termSerialNo']);
	if (termSerialNo != null) {
		snEntity.termSerialNo = termSerialNo;
	}
	final String? termStatus = jsonConvert.convert<String>(json['termStatus']);
	if (termStatus != null) {
		snEntity.termStatus = termStatus;
	}
	final String? termType = jsonConvert.convert<String>(json['termType']);
	if (termType != null) {
		snEntity.termType = termType;
	}
	final String? tunnelCode = jsonConvert.convert<String>(json['tunnelCode']);
	if (tunnelCode != null) {
		snEntity.tunnelCode = tunnelCode;
	}
	final String? unactivateExecuteTime = jsonConvert.convert<String>(json['unactivateExecuteTime']);
	if (unactivateExecuteTime != null) {
		snEntity.unactivateExecuteTime = unactivateExecuteTime;
	}
	final double? version = jsonConvert.convert<double>(json['version']);
	if (version != null) {
		snEntity.version = version;
	}
	final double? willAdjustFee = jsonConvert.convert<double>(json['willAdjustFee']);
	if (willAdjustFee != null) {
		snEntity.willAdjustFee = willAdjustFee;
	}
	final double? withdrawFee = jsonConvert.convert<double>(json['withdrawFee']);
	if (withdrawFee != null) {
		snEntity.withdrawFee = withdrawFee;
	}
	final double? withdrawFeePLAdjust = jsonConvert.convert<double>(json['withdrawFeePLAdjust']);
	if (withdrawFeePLAdjust != null) {
		snEntity.withdrawFeePLAdjust = withdrawFeePLAdjust;
	}
	final String? zeroCashBackStatus = jsonConvert.convert<String>(json['zeroCashBackStatus']);
	if (zeroCashBackStatus != null) {
		snEntity.zeroCashBackStatus = zeroCashBackStatus;
	}
	return snEntity;
}

Map<String, dynamic> $SnEntityToJson(SnEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['activateTime'] = entity.activateTime;
	data['activatedStatus'] = entity.activatedStatus;
	data['adjustFee'] = entity.adjustFee;
	data['adjustFeeExecuteTime'] = entity.adjustFeeExecuteTime;
	data['allOrgNo'] = entity.allOrgNo;
	data['allSaleNo'] = entity.allSaleNo;
	data['bindAgentTime'] = entity.bindAgentTime;
	data['bindMercTime'] = entity.bindMercTime;
	data['bindStatus'] = entity.bindStatus;
	data['branchNum'] = entity.branchNum;
	data['createShowName'] = entity.createShowName;
	data['createTime'] = entity.createTime;
	data['createUser'] = entity.createUser;
	data['createUserName'] = entity.createUserName;
	data['execPolicyCode'] = entity.execPolicyCode;
	data['execSubPolicyCode'] = entity.execSubPolicyCode;
	data['feeContent'] = entity.feeContent;
	data['feeRatePLAdjust'] = entity.feeRatePLAdjust;
	data['feeType'] = entity.feeType;
	data['firstOrderTime'] = entity.firstOrderTime;
	data['id'] = entity.id;
	data['importBatchNo'] = entity.importBatchNo;
	data['inPrice'] = entity.inPrice;
	data['isEncrypt'] = entity.isEncrypt;
	data['isQualified'] = entity.isQualified;
	data['justTradeMachine'] = entity.justTradeMachine;
	data['lastGoalStatus'] = entity.lastGoalStatus;
	data['lastGoalTime'] = entity.lastGoalTime;
	data['lastModifyShowName'] = entity.lastModifyShowName;
	data['lastModifyTime'] = entity.lastModifyTime;
	data['lastModifyUser'] = entity.lastModifyUser;
	data['lastModifyUserName'] = entity.lastModifyUserName;
	data['lockMerFee'] = entity.lockMerFee;
	data['lockModifyMerFee'] = entity.lockModifyMerFee;
	data['manufacturerName'] = entity.manufacturerName;
	data['manufacturerNo'] = entity.manufacturerNo;
	data['merCode'] = entity.merCode;
	data['merName'] = entity.merName;
	data['merShortName'] = entity.merShortName;
	data['modelName'] = entity.modelName;
	data['modelNo'] = entity.modelNo;
	data['modelStatus'] = entity.modelStatus;
	data['orgGrade'] = entity.orgGrade;
	data['orgNo'] = entity.orgNo;
	data['outPrice'] = entity.outPrice;
	data['payCode'] = entity.payCode;
	data['payPolicyCode'] = entity.payPolicyCode;
	data['paySubPolicyCode'] = entity.paySubPolicyCode;
	data['processStatus'] = entity.processStatus;
	data['productCode'] = entity.productCode;
	data['productName'] = entity.productName;
	data['proxyCode'] = entity.proxyCode;
	data['proxyName'] = entity.proxyName;
	data['saleNo'] = entity.saleNo;
	data['servciceFeeCharged'] = entity.servciceFeeCharged;
	data['serviceFee'] = entity.serviceFee;
	data['serviceFeeCashBackStatus'] = entity.serviceFeeCashBackStatus;
	data['simcardFee'] = entity.simcardFee;
	data['simcardFeeCharged'] = entity.simcardFeeCharged;
	data['simcardFeeChargedNum'] = entity.simcardFeeChargedNum;
	data['simcardFeeChargedTime'] = entity.simcardFeeChargedTime;
	data['source'] = entity.xSource;
	data['tels'] = entity.tels;
	data['termCode'] = entity.termCode;
	data['termNo'] = entity.termNo;
	data['termSerialNo'] = entity.termSerialNo;
	data['termStatus'] = entity.termStatus;
	data['termType'] = entity.termType;
	data['tunnelCode'] = entity.tunnelCode;
	data['unactivateExecuteTime'] = entity.unactivateExecuteTime;
	data['version'] = entity.version;
	data['willAdjustFee'] = entity.willAdjustFee;
	data['withdrawFee'] = entity.withdrawFee;
	data['withdrawFeePLAdjust'] = entity.withdrawFeePLAdjust;
	data['zeroCashBackStatus'] = entity.zeroCashBackStatus;
	return data;
}