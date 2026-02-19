import 'package:hrms_mobile/utils/helpers/type_converters.dart';

class UserIdInfo {
  String? id;
  String? name;
  String? email;
  String? role;

  UserIdInfo({this.id, this.name, this.email, this.role});

  factory UserIdInfo.fromJson(Map<String, dynamic> json) {
    return UserIdInfo(
      id: convertToString(json['_id']),
      name: convertToString(json['name']),
      email: convertToString(json['email']),
      role: convertToString(json['role']),
    );
  }
}

class ApprovedByInfo {
  String? id;
  String? name;
  String? role;

  ApprovedByInfo({this.id, this.name, this.role});

  factory ApprovedByInfo.fromJson(Map<String, dynamic> json) {
    return ApprovedByInfo(
      id: convertToString(json['_id']),
      name: convertToString(json['name']),
      role: convertToString(json['role']),
    );
  }
}
