import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_seed/utils/mock/mock.config.dart';

class MockInterceptor extends Interceptor {
  MockInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Check if the requested endpoint match in the
    var mockURLObject = endpointList.firstWhere(
        (element) => element['url']!.contains(options.path.toString()));
    // if the endpoint is matched then skip adding the token.'
    if (mockURLObject.isNotEmpty) {
      var response = Response(
          requestOptions: options,
          data: await rootBundle.loadString(mockURLObject['jsonPath']!),
          statusCode: 200);
      return handler.resolve(response);
    }

    // Load your token here and pass to the header
    var token = '';
    options.headers.addAll({'Authorization': token});
    return handler.next(options);
  }

  // You can also perform some actions in the response or onError.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
