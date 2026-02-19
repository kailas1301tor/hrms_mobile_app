class PendingApprovalsResponse {
  int? count;
  List<PendingRequestItem>? data;

  PendingApprovalsResponse({this.count, this.data});

  PendingApprovalsResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <PendingRequestItem>[];
      json['data'].forEach((v) {
        data!.add(PendingRequestItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PendingRequestItem {
  String? id;
  UserId? userId;
  String? requestId;
  String? requestType;
  String? status;
  String? submittedAt;
  Details? details;
  String? remarks;
  String? createdAt;
  String? updatedAt;

  PendingRequestItem({
    this.id,
    this.userId,
    this.requestId,
    this.requestType,
    this.status,
    this.submittedAt,
    this.details,
    this.remarks,
    this.createdAt,
    this.updatedAt,
  });

  PendingRequestItem.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
    requestId = json['requestId'];
    requestType = json['requestType'];
    status = json['status'];
    submittedAt = json['submittedAt'];
    details = json['details'] != null
        ? Details.fromJson(json['details'])
        : null;
    remarks = json['remarks'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    if (userId != null) {
      data['userId'] = userId!.toJson();
    }
    data['requestId'] = requestId;
    data['requestType'] = requestType;
    data['status'] = status;
    data['submittedAt'] = submittedAt;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    data['remarks'] = remarks;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class UserId {
  String? id;
  String? name;
  String? role;

  UserId({this.id, this.name, this.role});

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['role'] = role;
    return data;
  }
}

class Details {
  String? amount;
  String? repaymentPeriod;
  String? reason;
  String? subType;

  Details({this.amount, this.repaymentPeriod, this.reason, this.subType});

  Details.fromJson(Map<String, dynamic> json) {
    amount = json['amount']?.toString();
    repaymentPeriod = json['repaymentPeriod']?.toString();
    reason = json['reason']?.toString();
    subType = json['subType']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['repaymentPeriod'] = repaymentPeriod;
    data['reason'] = reason;
    data['subType'] = subType;
    return data;
  }
}
