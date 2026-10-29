import 'package:shared_preferences/shared_preferences.dart';

class AppInitializer {
  static Future<void> init(SharedPreferences prefs) async {
    final isFirst = prefs.getBool('app_installed') ?? true;

    if (isFirst) {
      await prefs.clear(); // or selective clear
      await prefs.setBool('app_installed', false);
    }
  }
}
