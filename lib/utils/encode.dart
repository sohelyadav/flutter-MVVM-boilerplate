import 'dart:convert';

String encodePassword(String password) {
  return base64.encode(utf8.encode(password));
}
String dummyNetworkImage =
    "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";

const List<String> dummyLanguage = ["Hindi", "English", "Bengali"];