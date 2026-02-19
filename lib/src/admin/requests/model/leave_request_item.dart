import 'package:hrms_mobile/utils/helpers/type_converters.dart';

import 'admin_request_common.dart';

class LeaveRequestDetails {
  final String? leaveType;
  final String? leaveTypeId;
  final bool? isPaid;
  final String? numberOfDays;
  final String? fromDate;
  final String? toDate;
  final String? reason;

  LeaveRequestDetails({
    this.leaveType,
    this.leaveTypeId,
    this.isPaid,
    this.numberOfDays,
    this.fromDate,
    this.toDate,
    this.reason,
  });

  factory LeaveRequestDetails.fromJson(Map<String, dynamic> json) {
    return LeaveRequestDetails(
      leaveType: convertToString(json['leaveType']),
      leaveTypeId: convertToString(json['leaveTypeId']),
      isPaid: convertToBool(json['isPaid']),
      numberOfDays: convertToString(json['numberOfDays']),
      fromDate: convertToString(json['fromDate']),
      toDate: convertToString(json['toDate']),
      reason: convertToString(json['reason']),
    );
  }
}

class LeaveRequestItem {
  final String? id;
  final UserIdInfo? userId;
  final String? requestId;
  final String? requestType;
  final String? status;
  final String? submittedAt;
  final LeaveRequestDetails? details;
  final String? remarks;
  final ApprovedByInfo? approvedBy;
  final String? approvedAt;
  final String? rejectionReason;

  LeaveRequestItem({
    this.id,
    this.userId,
    this.requestId,
    this.requestType,
    this.status,
    this.submittedAt,
    this.details,
    this.remarks,
    this.approvedBy,
    this.approvedAt,
    this.rejectionReason,
  });

  factory LeaveRequestItem.fromJson(Map<String, dynamic> json) {
    final detailsJson = convertToMap(json['details']);
    return LeaveRequestItem(
      id: convertToString(json['_id']),
      userId: json['userId'] != null
          ? UserIdInfo.fromJson(convertToMap(json['userId']))
          : null,
      requestId: convertToString(json['requestId']),
      requestType: convertToString(json['requestType']),
      status: convertToString(json['status']),
      submittedAt: convertToString(json['submittedAt']),
      details: detailsJson.isEmpty
          ? null
          : LeaveRequestDetails.fromJson(detailsJson),
      remarks: convertToString(json['remarks']),
      approvedBy: json['approvedBy'] != null
          ? ApprovedByInfo.fromJson(convertToMap(json['approvedBy']))
          : null,
      approvedAt: convertToString(json['approvedAt']),
      rejectionReason: convertToString(json['rejectionReason']),
    );
  }
}
