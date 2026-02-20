import 'package:hrms_mobile/utils/helpers/type_converters.dart';

class SubmitActionResponse {
  final bool? success;
  final String? message;
  final Map<String, dynamic>? data;

  SubmitActionResponse({
    this.success,
    this.message,
    this.data,
  });

  factory SubmitActionResponse.fromJson(Map<String, dynamic> json) {
    return SubmitActionResponse(
      success: convertToBool(json['success']),
      message: convertToString(json['message']),
      data: json['data'] != null ? convertToMap(json['data']) : null,
    );
  }
}
