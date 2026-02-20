import 'package:hrms_mobile/utils/helpers/type_converters.dart';

class LeaveTypeItem {
  final String? id;
  final String? name;
  final String? type;
  final bool? isActive;

  LeaveTypeItem({
    this.id,
    this.name,
    this.type,
    this.isActive,
  });

  factory LeaveTypeItem.fromJson(Map<String, dynamic> json) {
    return LeaveTypeItem(
      id: convertToString(json['_id']),
      name: convertToString(json['name']),
      type: convertToString(json['type']),
      isActive: convertToBool(json['isActive']),
    );
  }
}
