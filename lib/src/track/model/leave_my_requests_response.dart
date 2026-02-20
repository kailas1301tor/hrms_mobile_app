import 'package:hrms_mobile/src/admin/requests/model/leave_request_item.dart';
import 'package:hrms_mobile/src/track/model/my_requests_pagination.dart';
import 'package:hrms_mobile/utils/helpers/type_converters.dart';

class LeaveMyRequestsResponse {
  final bool? success;
  final String? message;
  final List<LeaveRequestItem> data;
  final MyRequestsPagination? pagination;

  LeaveMyRequestsResponse({
    this.success,
    this.message,
    required this.data,
    this.pagination,
  });

  factory LeaveMyRequestsResponse.fromJson(Map<String, dynamic> json) {
    final list = convertToList(json['data']);
    final paginationJson = json['pagination'];
    return LeaveMyRequestsResponse(
      success: convertToBool(json['success']),
      message: convertToString(json['message']),
      data:
          list.map((e) => LeaveRequestItem.fromJson(convertToMap(e))).toList(),
      pagination: paginationJson != null
          ? MyRequestsPagination.fromJson(convertToMap(paginationJson))
          : null,
    );
  }
}
