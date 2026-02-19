import 'package:hrms_mobile/utils/helpers/type_converters.dart';

import 'admin_request_common.dart';

class SalaryAdvanceRequestItem {
  final String? id;
  final UserIdInfo? userId;
  final String? requestId;
  final String? requestType;
  final String? subType;
  final String? status;
  final String? submittedAt;
  final String? amount;
  final String? repaymentPeriod;
  final String? reason;
  final String? remarks;
  final ApprovedByInfo? approvedBy;
  final String? approvedAt;
  final String? rejectionReason;

  SalaryAdvanceRequestItem({
    this.id,
    this.userId,
    this.requestId,
    this.requestType,
    this.subType,
    this.status,
    this.submittedAt,
    this.amount,
    this.repaymentPeriod,
    this.reason,
    this.remarks,
    this.approvedBy,
    this.approvedAt,
    this.rejectionReason,
  });

  factory SalaryAdvanceRequestItem.fromJson(Map<String, dynamic> json) {
    final details = convertToMap(json['details']);
    return SalaryAdvanceRequestItem(
      id: convertToString(json['_id']),
      userId: json['userId'] != null
          ? UserIdInfo.fromJson(convertToMap(json['userId']))
          : null,
      requestId: convertToString(json['requestId']),
      requestType: convertToString(json['requestType']),
      subType: convertToString(json['subType']) ?? convertToString(details['subType']),
      status: convertToString(json['status']),
      submittedAt: convertToString(json['submittedAt']),
      amount: convertToString(details['amount']),
      repaymentPeriod: convertToString(details['repaymentPeriod']),
      reason: convertToString(details['reason']),
      remarks: convertToString(json['remarks']),
      approvedBy: json['approvedBy'] != null
          ? ApprovedByInfo.fromJson(convertToMap(json['approvedBy']))
          : null,
      approvedAt: convertToString(json['approvedAt']),
      rejectionReason: convertToString(json['rejectionReason']),
    );
  }
}
