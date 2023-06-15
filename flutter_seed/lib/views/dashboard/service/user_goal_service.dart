import 'dart:convert';

import 'package:flutter_seed/constants/app_url.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../../utils/http_services/http_service.dart';
import '../modals/sample_model.dart';

class UserGoalService {
  dynamic response;
  final HttpService httpService = HttpService();
 
  // ------------------API calls------------------------//
  Future<dynamic> getUserGoalData() async {
    try {
      response = await httpService.request(
        url: Urls().entries,
        method: Method.get,
      );
      return response;
    } catch (e) {
      GetIt.instance<Talker>().handle(e);
    }
  }


  Future<dynamic> exGetHotelsData() async {
    try {
      response = await httpService.request(
        url: Urls().hotelType,
        method: Method.get,
      );
      return response;
    } catch (e) {
      GetIt.instance<Talker>().handle(e);
    }
  }
  Future<dynamic> getHotelsData() async {
    try {
      response = await httpService.request(
        url: Urls().hotels,
        method: Method.get,
      );
      return response;
    } catch (e) {
      GetIt.instance<Talker>().handle(e);
    }
  }
  Future<dynamic> userProfile() async {
    try {
      response = await httpService.request(
        url: Urls().entries,
        method: Method.get,
      );
      return SampleModel.fromJson(json.decode(response.data));
    } catch (e) {
      GetIt.instance<Talker>().handle(e);
    }
  }
    Future<dynamic> userProfile2() async {
    try {
      response = await httpService.request(
        url: Urls().user,
        method: Method.get,
      );
      return SampleModel.fromJson(json.decode(response.data));
    } catch (e) {
      GetIt.instance<Talker>().handle(e);
    }
  }
}