class SummaryStatsResponse {
  int? present;
  int? late;
  int? absent;
  int? totalEmployees;
  int? pendingRequests;

  SummaryStatsResponse({
    this.present,
    this.late,
    this.absent,
    this.totalEmployees,
    this.pendingRequests,
  });

  SummaryStatsResponse.fromJson(Map<String, dynamic> json) {
    present = json['present'];
    late = json['late'];
    absent = json['absent'];
    totalEmployees = json['totalEmployees'];
    pendingRequests = json['pendingRequests'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['present'] = present;
    data['late'] = late;
    data['absent'] = absent;
    data['totalEmployees'] = totalEmployees;
    data['pendingRequests'] = pendingRequests;
    return data;
  }
}
