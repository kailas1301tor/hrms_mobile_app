class StaffRequestResponse {
  String? id;
  String? userId;
  String? requestId;
  String? requestType;
  String? subType;
  String? status;
  String? submittedAt;
  RequestDetails? details;
  String? remarks;
  String? createdAt;

  StaffRequestResponse({
    this.id,
    this.userId,
    this.requestId,
    this.requestType,
    this.subType,
    this.status,
    this.submittedAt,
    this.details,
    this.remarks,
    this.createdAt,
  });

  StaffRequestResponse.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['userId'];
    requestId = json['requestId'];
    requestType = json['requestType'];
    subType = json['subType'];
    status = json['status'];
    submittedAt = json['submittedAt'];
    details = json['details'] != null
        ? RequestDetails.fromJson(json['details'])
        : null;
    remarks = json['remarks'];
    createdAt = json['createdAt'];
  }
}

class RequestDetails {
  // Common
  String? reason;

  // Salary specific
  String? subType;
  dynamic amount; // Can be int or string based on JSON
  String? repaymentPeriod;

  // Leave specific
  String? leaveType;
  String? leaveTypeId;
  bool? isPaid;
  String? numberOfDays;
  String? fromDate;
  String? toDate;

  RequestDetails({
    this.reason,
    this.subType,
    this.amount,
    this.repaymentPeriod,
    this.leaveType,
    this.leaveTypeId,
    this.isPaid,
    this.numberOfDays,
    this.fromDate,
    this.toDate,
  });

  RequestDetails.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    subType = json['subType'];
    amount = json['amount'];
    repaymentPeriod = json['repaymentPeriod']?.toString();
    leaveType = json['leaveType'];
    leaveTypeId = json['leaveTypeId'];
    isPaid = json['isPaid'];
    numberOfDays = json['numberOfDays'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
  }
}
