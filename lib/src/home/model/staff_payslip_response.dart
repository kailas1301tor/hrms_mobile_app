class StaffPayslipResponse {
  String? id;
  int? year;
  String? employee;
  int? month;
  List<Allowances>? allowances;
  double? basicSalary;
  String? createdAt;
  List<Deductions>? deductions;
  double? netSalary;
  String? status;
  double? totalAllowances;
  double? totalDeductions;
  String? updatedAt;

  StaffPayslipResponse({
    this.id,
    this.year,
    this.employee,
    this.month,
    this.allowances,
    this.basicSalary,
    this.createdAt,
    this.deductions,
    this.netSalary,
    this.status,
    this.totalAllowances,
    this.totalDeductions,
    this.updatedAt,
  });

  StaffPayslipResponse.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    year = json['year'];
    employee = json['employee'];
    month = json['month'];
    if (json['allowances'] != null) {
      allowances = <Allowances>[];
      json['allowances'].forEach((v) {
        allowances!.add(Allowances.fromJson(v));
      });
    }
    basicSalary = (json['basicSalary'] as num?)?.toDouble();
    createdAt = json['createdAt'];
    if (json['deductions'] != null) {
      deductions = <Deductions>[];
      json['deductions'].forEach((v) {
        deductions!.add(Deductions.fromJson(v));
      });
    }
    netSalary = (json['netSalary'] as num?)?.toDouble();
    status = json['status'];
    totalAllowances = (json['totalAllowances'] as num?)?.toDouble();
    totalDeductions = (json['totalDeductions'] as num?)?.toDouble();
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['year'] = year;
    data['employee'] = employee;
    data['month'] = month;
    if (allowances != null) {
      data['allowances'] = allowances!.map((v) => v.toJson()).toList();
    }
    data['basicSalary'] = basicSalary;
    data['createdAt'] = createdAt;
    if (deductions != null) {
      data['deductions'] = deductions!.map((v) => v.toJson()).toList();
    }
    data['netSalary'] = netSalary;
    data['status'] = status;
    data['totalAllowances'] = totalAllowances;
    data['totalDeductions'] = totalDeductions;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Allowances {
  String? name;
  double? amount;
  String? type;
  String? meta;
  String? id;

  Allowances({this.name, this.amount, this.type, this.meta, this.id});

  Allowances.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = (json['amount'] as num?)?.toDouble();
    type = json['type'];
    meta = json['meta'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['amount'] = amount;
    data['type'] = type;
    data['meta'] = meta;
    data['_id'] = id;
    return data;
  }
}

class Deductions {
  String? name;
  double? amount;
  String? type;
  String? meta;
  String? id;

  Deductions({this.name, this.amount, this.type, this.meta, this.id});

  Deductions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = (json['amount'] as num?)?.toDouble();
    type = json['type'];
    meta = json['meta'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['amount'] = amount;
    data['type'] = type;
    data['meta'] = meta;
    data['_id'] = id;
    return data;
  }
}
