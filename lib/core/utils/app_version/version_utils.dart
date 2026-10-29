import 'package:package_info_plus/package_info_plus.dart';

class VersionUtils {
  VersionUtils._();

  //Version 1.0.1
  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  //AppBuildNumber 12
  static Future<String> getAppBuildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  static Future<String> getCurrentVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.version;
  }

  static Future<String> getBuildNumber() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.buildNumber;
  }

  static bool isNewerVersion(String latestVersion, String currentVersion) {
    final latest = _parseVersion(latestVersion);
    final current = _parseVersion(currentVersion);

    final maxLength = latest.length > current.length
        ? latest.length
        : current.length;

    for (int i = 0; i < maxLength; i++) {
      final latestPart = i < latest.length ? latest[i] : 0;
      final currentPart = i < current.length ? current[i] : 0;

      if (latestPart > currentPart) {
        return true;
      }

      if (latestPart < currentPart) {
        return false;
      }
    }

    return false;
  }

  static List<int> _parseVersion(String version) {
    return version
        .trim()
        .replaceFirst('v', '')
        .split('.')
        .map((part) => int.tryParse(part) ?? 0)
        .toList();
  }

  // // check version
  // // 1.1.0 > 1.0.9 → true
  // // 1.0.9 > 1.1.0 → false
  // // 1.0.5 == 1.0.5 → true
  // // 1.0.10 > 1.0.9 → true

  // bool isNewerVersion(String latestVersion, String currentVersion) {
  //   final latest = latestVersion.split('.').map(int.parse).toList();
  //   final current = currentVersion.split('.').map(int.parse).toList();

  //   final maxLength =
  //       latest.length > current.length ? latest.length : current.length;

  //   for (int i = 0; i < maxLength; i++) {
  //     final latestPart = i < latest.length ? latest[i] : 0;
  //     final currentPart = i < current.length ? current[i] : 0;

  //     if (latestPart > currentPart) {
  //       return true;
  //     }

  //     if (latestPart < currentPart) {
  //       return false;
  //     }
  //   }

  //   return false;
  // }

  //   final currentVersion = "1.0.9";
  // final latestVersion = "1.1.0";

  // if (isNewerVersion(latestVersion, currentVersion)) {
  //   // Show update dialog
  // }
}
