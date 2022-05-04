import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/extensions/string.extensions.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import '../api_interceptor_service.dart';

class ApiService {
  http.Client client = InterceptedClient.build(interceptors: [
    ApiInterceptorService(),
  ])
    ..requestTimeout = Duration(seconds: 40);

  // MultiPartApiInterceptor multiPartClient = MultiPartApiInterceptor();

  // Future<RemoteConfigResponse> appConfig() async {
  //   Uri url = '${AppConstants.kBaseUrl}/$URL_GET_CONFIG'.toUri();
  //   try {
  //     Response response =
  //         await client.get(url, headers: {"apikey": AppConstants.guestApiKey});
  //     return RemoteConfigResponse.fromJson(validateResponse(response));
  //   } on SocketException {
  //     throw Failure("Server not responding");
  //   } catch (e) {
  //     if (e.toString().contains('SocketException')) {
  //       throw Failure("No Internet Connection");
  //     } else {
  //       if (e is Failure)
  //         throw Failure(e.message,
  //             code: e.code, error: e.error, errorMessage: e.errorMessage);
  //       else
  //         throw Failure(e.toString());
  //     }
  //   }
  // }

  

  // Future<AddWatchlistResponse> addWatchlist(
  //     AddWatchlistRequest addWatchlistRequest) async {
  //   var response;
  //   Uri url = '${AppConstants.kBaseUrl}/$URL_ADD_WATCHLIST'.toUri();
  //   try {
  //     response = await client.post(url,
  //         headers: {"apikey": AppConstants.AUTH_TOKEN ?? ""},
  //         body: jsonEncode(addWatchlistRequest));
  //     return AddWatchlistResponse.fromJson(validateResponse(response));
  //   } on SocketException {
  //     throw Failure("Server not responding");
  //   } catch (e) {
  //     if (e.toString().contains('SocketException')) {
  //       throw Failure("No Internet Connection");
  //     } else {
  //       if (e is Failure)
  //         throw Failure(e.message,
  //             code: e.code, error: e.error, errorMessage: e.errorMessage);
  //       else
  //         throw Failure(e.toString());
  //     }
  //   }
  // }

}

final apiServiceProvider = Provider<ApiService>((_) => ApiService());
