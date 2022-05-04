import 'dart:convert';

String removeNullAndEmptyParamsRequest(Map<String, dynamic> mapToEdit) {
// Remove all null values; they cause validation errors
  List<String> newKey = [];
  List<dynamic> newValue = [];
  final keys = mapToEdit.keys.toList(growable: false);
  for (String key in keys) {
    final Map<String, dynamic> value = mapToEdit[key];
    if (value == null) {
      mapToEdit.remove(key);
      print("Key removed $key");
    }
    // else if (value is String) {
    //   if (value.isEmpty) {
    //     mapToEdit.remove(key);
    //     print("Key removed $key");
    //   } else {
    //     newKey.add(key);
    //     newValue.add(value);
    //   }
    // }
    else if (value is Map) {
      if (value == {}) {
        mapToEdit.remove(key);
        print("Key removed $key");
      } else {
        newKey.add(key);
        newValue.add(value);
        removeNullAndEmptyParamsRequest(value);
      }
    }
    // else if (value is List) {
    //   if (value.isEmpty) {
    //     mapToEdit.remove(key);
    //     print("Key removed $key");
    //   } else {
    //     newKey.add(key);
    //     newValue.add(value);
    //   }
    // }
    else if (value is int) {
      if (value == null) {
        mapToEdit.remove(key);
        print("Key removed $key");
      } else {
        newKey.add(key);
        newValue.add(value);
      }
    } else if (value is bool) {
      if (value == null) {
        mapToEdit.remove(key);
        print("Key removed $key");
      } else {
        newKey.add(key);
        newValue.add(value);
      }
    } else {
      newKey.add(key);
      newValue.add(value);
    }
  }
  Map<String, dynamic> map = Map.fromIterables(newKey, newValue);
  print(map);
  return json.encode(map);
}

String removeNullAndEmptyParams(Map<String, dynamic> mapToEdit) {
// Remove all null values; they cause validation errors
  List<String> newKey = [];
  List<dynamic> newValue = [];
  final keys = mapToEdit.keys.toList(growable: false);
  for (String key in keys) {
    final Map<String, dynamic> value = mapToEdit[key];
    if (value == null) {
      mapToEdit.remove(key);
      print("Key removed $key");
    } else if (value is String) {
      if (value.isEmpty) {
        mapToEdit.remove(key);
        print("Key removed $key");
      } else {
        newKey.add(key);
        newValue.add(value);
      }
    } else if (value is Map) {
      if (value == {}) {
        mapToEdit.remove(key);
        print("Key removed $key");
      } else {
        newKey.add(key);
        newValue.add(value);
        removeNullAndEmptyParams(value);
      }
    }
    // else if (value is List) {
    //   if (value.isEmpty) {
    //     mapToEdit.remove(key);
    //     print("Key removed $key");
    //   } else {
    //     newKey.add(key);
    //     newValue.add(value);
    //   }
    // }
    else if (value is int) {
      if (value == null) {
        mapToEdit.remove(key);
        print("Key removed $key");
      } else {
        newKey.add(key);
        newValue.add(value);
      }
    } else if (value is bool) {
      if (value == null) {
        mapToEdit.remove(key);
        print("Key removed $key");
      } else {
        newKey.add(key);
        newValue.add((value as bool) ? "True" : "False");
      }
    } else {
      newKey.add(key);
      newValue.add(value);
    }
  }
  Map<String, dynamic> map = Map.fromIterables(newKey, newValue);
  // print(map);
  return json.encode(map);
}
