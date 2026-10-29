const String environment = String.fromEnvironment('ENV', defaultValue: 'UAT');

class EnvironmentConfig {
  static const String env = environment;

  static bool get isUAT => env == "UAT";
  static bool get isPROD => env == "PROD";
}
