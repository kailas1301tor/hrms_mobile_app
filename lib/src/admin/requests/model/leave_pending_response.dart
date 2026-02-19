import 'package:hrms_mobile/utils/helpers/type_converters.dart';

import 'leave_request_item.dart';

class LeavePendingResponse {
  bool? success;
  int? count;
  int? limit;
  int? page;
  int? totalPages;
  int? totalDocs;
  List<LeaveRequestItem> data;

  LeavePendingResponse({
    this.success,
    this.count,
    this.limit,
    this.page,
    this.totalPages,
    this.totalDocs,
    required this.data,
  });

  factory LeavePendingResponse.fromJson(Map<String, dynamic> json) {
    final list = convertToList(json['data']);
    return LeavePendingResponse(
      success: convertToBool(json['success']),
      count: convertToInt(json['count']),
      limit: convertToInt(json['limit']),
      page: convertToInt(json['page']),
      totalPages: convertToInt(json['totalPages']),
      totalDocs: convertToInt(json['totalDocs']),
      data: list.map((e) => LeaveRequestItem.fromJson(convertToMap(e))).toList(),
    );
  }
}
