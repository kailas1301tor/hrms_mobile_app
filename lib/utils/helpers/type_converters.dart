String? convertToString(dynamic value) {
  if (value == null) return null;
  if (value is String) return value;
  return value.toString();
}

int? convertToInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

double? convertToDouble(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

bool? convertToBool(dynamic value) {
  if (value == null) return null;
  if (value is bool) return value;
  if (value is String) {
    return value.toLowerCase() == 'true' || value == '1';
  }
  if (value is int) return value == 1;
  return null;
}

List<dynamic> convertToList(dynamic value) {
  if (value == null) return [];
  if (value is List) return value;
  return [];
}

Map<String, dynamic> convertToMap(dynamic value) {
  if (value == null) return {};
  if (value is Map<String, dynamic>) return value;
  if (value is Map) {
    return value.map((key, val) => MapEntry(key.toString(), val));
  }
  return {};
}

