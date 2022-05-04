bool isNotString(dynamic value) {
  if (value == null) return true;
  return !(value is String);
}

bool isNotInt(dynamic value) {
  if (value == null) return true;
  return !(value is int);
}

bool isNotBool(dynamic value) {
  if (value == null) return true;
  return !(value is bool);
}

bool isNotList(dynamic value) {
  if (value == null) return true;
  return !(value is List);
}

bool isNotDouble(dynamic value) {
  if (value == null) return true;
  return !(value is double);
}

bool isNotDatetime(dynamic value) {
  if (value == null) return true;
  return DateTime.tryParse(value) == null;
}

bool isNotMap(dynamic value) {
  if (value == null) return true;
  return !(value is Map);
}
