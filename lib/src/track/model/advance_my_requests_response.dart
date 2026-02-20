import 'package:hrms_mobile/src/admin/requests/model/salary_advance_request_item.dart';
import 'package:hrms_mobile/src/track/model/my_requests_pagination.dart';
import 'package:hrms_mobile/utils/helpers/type_converters.dart';

class AdvanceMyRequestsResponse {
  final bool? success;
  final String? message;
  final List<SalaryAdvanceRequestItem> data;
  final MyRequestsPagination? pagination;

  AdvanceMyRequestsResponse({
    this.success,
    this.message,
    required this.data,
    this.pagination,
  });

  factory AdvanceMyRequestsResponse.fromJson(Map<String, dynamic> json) {
    final list = convertToList(json['data']);
    final paginationJson = json['pagination'];
    return AdvanceMyRequestsResponse(
      success: convertToBool(json['success']),
      message: convertToString(json['message']),
      data: list
          .map((e) => SalaryAdvanceRequestItem.fromJson(convertToMap(e)))
          .toList(),
      pagination: paginationJson != null
          ? MyRequestsPagination.fromJson(convertToMap(paginationJson))
          : null,
    );
  }
}
