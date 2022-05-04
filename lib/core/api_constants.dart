import 'package:flutter_mvvm_boilerplate/utils/constants.dart';

String middleware() {
  return AppConstants.AUTH_TOKEN != null ? "mobile" : "api";
}

const String URL_GSTIN_SEARCH_UNREGISTER = "api/search/";
