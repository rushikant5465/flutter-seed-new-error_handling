import 'base_config.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String dev = 'DEV';
  static const String qa = 'QA';
  static const String prod = 'PROD';
  static const String local = 'LOCAL';

  static const bool mockEnvironment =  String.fromEnvironment(
    'MOCK',
    defaultValue: 'false',
  ) == 'true' ? true:false;

  late BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.prod:
        return ProdConfig();
      case Environment.qa:
        return QaConfig();
      case Environment.local:
        return LocalConfig();
      default:
        return DevConfig();
    }
  }
}