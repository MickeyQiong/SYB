import 'package:leshua/generated/json/base/json_field.dart';
import 'package:leshua/generated/json/sn_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class SnEntity {

	String? activateTime;
	String? activatedStatus;
	double? adjustFee;
	String? adjustFeeExecuteTime;
	String? allOrgNo;
	String? allSaleNo;
	String? bindAgentTime;
	String? bindMercTime;
	String? bindStatus;
	String? branchNum;
	String? createShowName;
	String? createTime;
	String? createUser;
	String? createUserName;
	String? execPolicyCode;
	String? execSubPolicyCode;
	String? feeContent;
	String? feeRatePLAdjust;
	String? feeType;
	String? firstOrderTime;
	String? id;
	String? importBatchNo;
	double? inPrice;
	String? isEncrypt;
	String? isQualified;
	String? justTradeMachine;
	String? lastGoalStatus;
	String? lastGoalTime;
	String? lastModifyShowName;
	String? lastModifyTime;
	String? lastModifyUser;
	String? lastModifyUserName;
	String? lockMerFee;
	String? lockModifyMerFee;
	String? manufacturerName;
	String? manufacturerNo;
	String? merCode;
	String? merName;
	String? merShortName;
	String? modelName;
	String? modelNo;
	String? modelStatus;
	double? orgGrade;
	String? orgNo;
	double? outPrice;
	String? payCode;
	String? payPolicyCode;
	String? paySubPolicyCode;
	String? processStatus;
	String? productCode;
	String? productName;
	String? proxyCode;
	String? proxyName;
	String? saleNo;
	String? servciceFeeCharged;
	double? serviceFee;
	String? serviceFeeCashBackStatus;
	double? simcardFee;
	String? simcardFeeCharged;
	double? simcardFeeChargedNum;
	String? simcardFeeChargedTime;
	@JSONField(name: "source")
	String? xSource;
	String? tels;
	String? termCode;
	String? termNo;
	String? termSerialNo;
	String? termStatus;
	String? termType;
	String? tunnelCode;
	String? unactivateExecuteTime;
	double? version;
	double? willAdjustFee;
	double? withdrawFee;
	double? withdrawFeePLAdjust;
	String? zeroCashBackStatus;
  
  SnEntity();

  factory SnEntity.fromJson(Map<String, dynamic> json) => $SnEntityFromJson(json);

  Map<String, dynamic> toJson() => $SnEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}