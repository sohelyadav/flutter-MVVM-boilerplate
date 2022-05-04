import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:flutter_mvvm_boilerplate/app/app.dart';
import 'package:flutter_mvvm_boilerplate/utils/constants.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:get/get_connect.dart' as get_connect;

class ApiInterceptorService implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData? data}) async {
    data?.toHttpRequest().persistentConnection = false;
    // try {
    // await getFirebaseToken();
    // if (token != null) data?.headers['Authorization'] = "Bearer $token";
    data?.headers["Content-Type"] = "application/json";
    // if (!kReleaseMode) {
    debugPrint("====HEADERS====\n${data?.headers.toString()}");
    debugPrint("====URL====\n${data?.url}");
    debugPrint("====METHOD====\n${data?.method.toString()}");
    debugPrint("====PARAMS====\n${data?.params.toString()}");
    debugPrint("====REQUEST====\n${data?.body.toString()}");
    // }
    return data!;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData? data}) async {
    if (!Platform.isIOS) alice.onHttpResponse(data!.toHttpResponse());

    // if (!kReleaseMode) {
    debugPrint("====RESPONSE====\n${data?.body.toString()}");
    debugPrint("====STATUS CODE====\n${data?.statusCode.toString()}");
    // }
    if (data?.statusCode == 401) {
      // _sharedPrefsService.clear();
      AppConstants.reset();
      // _navigationService.pushNamedAndRemoveUntil(Routes.loginWithPhoneView);
    }
    return data!;
  }
}

// class MultiPartApiInterceptor extends http.BaseClient {
//   http.Client _httpClient = new http.Client();

//   @override
//   Future<http.StreamedResponse> send(http.BaseRequest request) async {
//     request.persistentConnection = false;
//     if (AppConstants.AUTH_TOKEN != null)
//       request.headers['Authorization'] =
//           "Bearer " + (AppConstants.AUTH_TOKEN ?? "");
//     request.headers["Content-Type"] = "application/json";
//     debugPrint(request.headers.toString());

//     debugPrint(request.url.toString());
//     Future<http.StreamedResponse> response = _httpClient.send(request);
//     // alice.onHttpClientRequest(request.);
//     debugPrint(request.url.toString());
//     alice.onHttpResponse(await http.Response.fromStream(await response));
//     return _httpClient.send(request);
//   }
// }
