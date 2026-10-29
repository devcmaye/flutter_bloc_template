import '../enums/app_enums.dart';
import '../network/api_service/api_constants.dart';

class FlavorConfig {
  final AppFlavor flavor;
  final String baseUrl;

  static late FlavorConfig instance;

  FlavorConfig._(this.flavor, this.baseUrl);

  factory FlavorConfig.uat() {
    instance = FlavorConfig._(AppFlavor.uat, ApiConstants.baseUrl);
    return instance;
  }

  factory FlavorConfig.prod() {
    instance = FlavorConfig._(AppFlavor.prod, ApiConstants.baseUrl);
    return instance;
  }
}
