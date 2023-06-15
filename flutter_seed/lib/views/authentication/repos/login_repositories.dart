import 'dart:convert';

import 'package:dio/dio.dart';
// import 'package:get_storage/get_storage.dart';

import '../../../constants/app_constants.dart';
import '../services/login_request.dart';

class LoginRepository {
  Future<dynamic> login(String email, String password) async {
    try {
      final Response response = await loginRequest(email, password);

      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.toString());
        final tokenData =
            Map<String, dynamic>.from(parsedResponse as Map<String, dynamic>);
        // final GetStorage token = GetStorage();
        // await token.write(accessToken, tokenData.values.toList()[0]['token']);
        // await token.write(refreshToken, tokenData.values.toList()[1]['token']);
        return true;
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
