import 'package:hrms_mobile/src/admin/requests/model/loan_request_item.dart';
import 'package:hrms_mobile/src/track/model/my_requests_pagination.dart';
import 'package:hrms_mobile/utils/helpers/type_converters.dart';

class LoanMyRequestsResponse {
  final bool? success;
  final String? message;
  final List<LoanRequestItem> data;
  final MyRequestsPagination? pagination;

  LoanMyRequestsResponse({
    this.success,
    this.message,
    required this.data,
    this.pagination,
  });

  factory LoanMyRequestsResponse.fromJson(Map<String, dynamic> json) {
    final list = convertToList(json['data']);
    final paginationJson = json['pagination'];
    return LoanMyRequestsResponse(
      success: convertToBool(json['success']),
      message: convertToString(json['message']),
      data: list.map((e) => LoanRequestItem.fromJson(convertToMap(e))).toList(),
      pagination: paginationJson != null
          ? MyRequestsPagination.fromJson(convertToMap(paginationJson))
          : null,
    );
  }
}
