import 'dart:convert';
import '../../../constants/app_url.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../../utils/http_services/http_service.dart';

Future<dynamic> loginRequest(String email, String password) async {
  dynamic response;
  final HttpService httpService = HttpService();
  final data = jsonEncode({
    'email': email,
    'password': password,
  });

  try {
    response = await httpService.request(
      url: loginEndPoint,
      method: Method.post,
      params: {'body': data},
    );
    return response;
  } catch (e) {
      GetIt.instance<Talker>().handle(e);
  }
}
