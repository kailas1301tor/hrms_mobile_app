class StaffAttendanceResponse {
  Summary? summary;
  Pagination? pagination;
  List<StaffAttendanceRecord>? data;

  StaffAttendanceResponse({this.summary, this.pagination, this.data});

  StaffAttendanceResponse.fromJson(Map<String, dynamic> json) {
    summary = json['summary'] != null
        ? Summary.fromJson(json['summary'])
        : null;
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <StaffAttendanceRecord>[];
      json['data'].forEach((v) {
        data!.add(StaffAttendanceRecord.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summary {
  int? total;
  int? present;
  int? absent;
  int? late;
  int? onLeave;

  Summary({this.total, this.present, this.absent, this.late, this.onLeave});

  Summary.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    present = json['Present'];
    absent = json['Absent'];
    late = json['Late'];
    onLeave = json['On Leave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['Present'] = present;
    data['Absent'] = absent;
    data['Late'] = late;
    data['On Leave'] = onLeave;
    return data;
  }
}

class Pagination {
  int? current;
  int? limit;
  int? totalRecords;
  int? totalPages;

  Pagination({this.current, this.limit, this.totalRecords, this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    limit = json['limit'];
    totalRecords = json['totalRecords'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current'] = current;
    data['limit'] = limit;
    data['totalRecords'] = totalRecords;
    data['totalPages'] = totalPages;
    return data;
  }
}

class StaffAttendanceRecord {
  String? id;
  String? employeeId;
  String? name;
  String? code;
  String? department;
  String? shift;
  String? checkIn;
  String? checkOut;
  String? workHours;
  String? status;
  bool? isManuallyEdited;
  EditedBy? editedBy;
  String? editedAt;
  String? editReason;

  StaffAttendanceRecord({
    this.id,
    this.employeeId,
    this.name,
    this.code,
    this.department,
    this.shift,
    this.checkIn,
    this.checkOut,
    this.workHours,
    this.status,
    this.isManuallyEdited,
    this.editedBy,
    this.editedAt,
    this.editReason,
  });

  StaffAttendanceRecord.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    employeeId = json['employeeId'];
    name = json['name'];
    code = json['code'];
    department = json['department'];
    shift = json['shift'];
    checkIn = "09:00 AM";
    // checkIn = json['checkIn'];
    checkOut = json['checkOut'];
    workHours = json['workHours'];
    status = json['status'];
    isManuallyEdited = json['isManuallyEdited'];
    editedBy = json['editedBy'] != null
        ? EditedBy.fromJson(json['editedBy'])
        : null;
    editedAt = json['editedAt'];
    editReason = json['editReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['employeeId'] = employeeId;
    data['name'] = name;
    data['code'] = code;
    data['department'] = department;
    data['shift'] = shift;
    data['checkIn'] = checkIn;
    data['checkOut'] = checkOut;
    data['workHours'] = workHours;
    data['status'] = status;
    data['isManuallyEdited'] = isManuallyEdited;
    if (editedBy != null) {
      data['editedBy'] = editedBy!.toJson();
    }
    data['editedAt'] = editedAt;
    data['editReason'] = editReason;
    return data;
  }
}

class EditedBy {
  String? id;
  String? name;

  EditedBy({this.id, this.name});

  EditedBy.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    return data;
  }
}
