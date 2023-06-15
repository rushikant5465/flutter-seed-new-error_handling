
import 'package:flutter_seed/constants/app_constants.dart';

abstract class BaseConfig {
  String get baseUrl;
}

class DevConfig implements BaseConfig {
  @override
  String get baseUrl => devBaseUrl;
}

class QaConfig implements BaseConfig {
  @override
  String get baseUrl => qaBaseUrl;
}
class ProdConfig implements BaseConfig {
  @override
  String get baseUrl => prodBaseUrl;
}

class LocalConfig implements BaseConfig {
  @override
  String get baseUrl => localBaseUrl;
}