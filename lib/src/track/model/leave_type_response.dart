import 'package:hrms_mobile/src/track/model/leave_type_item.dart';
import 'package:hrms_mobile/utils/helpers/type_converters.dart';

class LeaveTypeResponse {
  final bool? success;
  final String? message;
  final List<LeaveTypeItem> data;

  LeaveTypeResponse({this.success, this.message, required this.data});

  factory LeaveTypeResponse.fromJson(Map<String, dynamic> json) {
    final list = convertToList(json['data']);
    return LeaveTypeResponse(
      success: convertToBool(json['success']),
      message: convertToString(json['message']),
      data: list.map((e) => LeaveTypeItem.fromJson(convertToMap(e))).toList(),
    );
  }

  /// When API returns a raw array of leave types
  factory LeaveTypeResponse.fromJsonArray(List<dynamic> list) {
    return LeaveTypeResponse(
      data: list.map((e) => LeaveTypeItem.fromJson(convertToMap(e))).toList(),
    );
  }
}
