import 'package:flutter/material.dart';
import '../../main.dart';
import '../constants/common_constants.dart';
import '../enums/app_enums.dart';

class AppRoutes {
  //splash
  static const String splash = '/splash';
  static const String onboard = '/onboard';

  //auth
  static const String get_start = "/get_start";
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //splash
      case splash:
        return MaterialPageRoute(builder: (_) => const TempApp());
      case onboard:
        return MaterialPageRoute(builder: (_) => const TempApp());
      // auth -> login , register , forget pin

      default:
        return MaterialPageRoute(builder: (_) => const TempApp());
    }
  }
}
