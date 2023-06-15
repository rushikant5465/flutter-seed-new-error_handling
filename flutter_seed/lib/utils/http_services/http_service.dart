import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_seed/config/environment/environment.dart';
import 'package:flutter_seed/utils/http_services/interceptors/jwt_refresh_interceptor.dart';
import 'package:get_it/get_it.dart';
import '../../constants/app_constants.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'interceptors/mock_interceptor.dart';

enum Method { post, get, put }

class HttpService {
  late Dio _dio;
  Map<String, dynamic> header = {
    'Content-Type': 'application/json',
  };
  //constructor
  HttpService() {
    init(header);
  }

  // function to append new headers
  void appendNewHeader(Map<String, dynamic> newHeaders) {
    var newHeader = {...header, ...newHeaders};
    init(newHeader);
  }

  // function to overwrite headers
  void overwriteHeaders(Map<String, dynamic> newHeaders) {
    init(newHeaders);
  }

 // Initialize http BaseOptions and interceptor
  Future<HttpService> init(Map<String, dynamic> header,
      [String? baseURLPreference]) async {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseURLPreference ?? Environment().config.baseUrl,
        headers: header,
      ),
    );

    initializeInterceptors();
    return this;
  }

  Future<dynamic> request({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
  }) async {
    Response<dynamic>? response;
    try {
      if (method == Method.post) {
        response = await _dio.post(
          url,
          data: params?['body'],
        );
      } else if (method == Method.put) {
        response = await _dio.put(
          url,
          data: params?['body'],
        );
      } else {
        response = await _dio.get(url, queryParameters: params);
      }

      if (response.statusCode == successStatusCode) {
        return response;
      } else if (response.statusCode == serverErrorStatusCode) {
        throw Exception(serverError);
      } else {
        throw Exception(somethingDoesWentWrong);
      }
    } on SocketException catch (_) {
      throw Exception(noInternetConnection);
    } on FormatException catch (_) {
      throw Exception(badResponseFormat);
    } on DioError catch (e) {
      if (e.response!.statusCode == badRequestStatusCode ||
          e.response!.statusCode == serverErrorStatusCode) {
        return e.response!;
      } else {
        throw Exception(e);
      }
    } catch (e) {
      throw Exception(somethingWentWrong);
    }
  }

  initializeInterceptors() {
    _dio.interceptors.add(GetIt.instance<TalkerDioLogger>());
    _dio.interceptors.add(JwtRefreshInterceptor());
    if (!Environment.mockEnvironment) {
      var authentInterceptors = MockInterceptor();
      _dio.interceptors.add(authentInterceptors);
    }

  }
}
