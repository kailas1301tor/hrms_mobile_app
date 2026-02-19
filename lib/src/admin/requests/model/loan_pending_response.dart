import 'package:hrms_mobile/utils/helpers/type_converters.dart';

import 'loan_request_item.dart';

class LoanPendingResponse {
  bool? success;
  int? count;
  int? limit;
  int? page;
  int? totalPages;
  int? totalDocs;
  List<LoanRequestItem> data;

  LoanPendingResponse({
    this.success,
    this.count,
    this.limit,
    this.page,
    this.totalPages,
    this.totalDocs,
    required this.data,
  });

  factory LoanPendingResponse.fromJson(Map<String, dynamic> json) {
    final list = convertToList(json['data']);
    return LoanPendingResponse(
      success: convertToBool(json['success']),
      count: convertToInt(json['count']),
      limit: convertToInt(json['limit']),
      page: convertToInt(json['page']),
      totalPages: convertToInt(json['totalPages']),
      totalDocs: convertToInt(json['totalDocs']),
      data: list.map((e) => LoanRequestItem.fromJson(convertToMap(e))).toList(),
    );
  }
}
