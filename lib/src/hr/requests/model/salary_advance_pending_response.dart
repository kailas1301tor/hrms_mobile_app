import 'package:hrms_mobile/utils/helpers/type_converters.dart';

import 'salary_advance_request_item.dart';

class SalaryAdvancePendingResponse {
  bool? success;
  int? count;
  int? limit;
  int? page;
  int? totalPages;
  int? totalDocs;
  List<SalaryAdvanceRequestItem> data;

  SalaryAdvancePendingResponse({
    this.success,
    this.count,
    this.limit,
    this.page,
    this.totalPages,
    this.totalDocs,
    required this.data,
  });

  factory SalaryAdvancePendingResponse.fromJson(Map<String, dynamic> json) {
    final list = convertToList(json['data']);
    return SalaryAdvancePendingResponse(
      success: convertToBool(json['success']),
      count: convertToInt(json['count']),
      limit: convertToInt(json['limit']),
      page: convertToInt(json['page']),
      totalPages: convertToInt(json['totalPages']),
      totalDocs: convertToInt(json['totalDocs']),
      data: list.map((e) => SalaryAdvanceRequestItem.fromJson(convertToMap(e))).toList(),
    );
  }
}
