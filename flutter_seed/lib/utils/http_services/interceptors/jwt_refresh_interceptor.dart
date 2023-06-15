import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:flutter_seed/constants/app_constants.dart';
import 'package:flutter_seed/constants/app_url.dart';

import '../http_service.dart';

class JwtRefreshInterceptor extends Interceptor {
  @override
  Future<void> onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response != null &&
        err.requestOptions.path != loginEndPoint &&
        err.requestOptions.path != refreshTokenEndPoint) {
      if (err.response!.statusCode == authErrorStatusCode) {
        RequestOptions request = err.requestOptions;

        await setRefreshToken(err);

        var retryResponse = await retry(request);
        handler.resolve(retryResponse);
      } else {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  setRefreshToken(DioError error) async {
    var response = await getRefreshToken();
    var data = jsonDecode(response.toString());
    var dataMap = Map<String, dynamic>.from(data as Map<String, dynamic>);

    // error.response?.requestOptions.headers['Authorization'] =
    //     'Bearer ${dataMap[accessToken]}';
    // GetStorage().write(accessToken, dataMap[accessToken]);
    // GetStorage().write(refreshToken, dataMap[refreshToken]);
  }

  dynamic getRefreshToken() async {
    final authToken =' GetStorage().read(accessToken)';
    final storedRefreshToken =' GetStorage().read(refreshToken)';

    Map<String, dynamic> headerWithAuth = {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $authToken'
    };

    final data = jsonEncode({
      'refresh_token': storedRefreshToken,
    });

    HttpService httpService = HttpService();
    httpService.init(headerWithAuth);

    var response = await httpService.request(
        url: refreshTokenEndPoint, method: Method.post, params: {'body': data});

    return response;
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    final HttpService httpService = HttpService();
    Map<String, dynamic> header = requestOptions.headers;
    httpService.init(header);
    Method method = Method.get;
    for (final value in Method.values) {
      if (value.toString().split('.').elementAt(1) == requestOptions.method) {
      method = value;
      } 
    }
    Future<Response<dynamic>> response;
    try {
      response = await httpService.request(
        url: requestOptions.path,
        method: method,
        params: requestOptions.queryParameters,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
