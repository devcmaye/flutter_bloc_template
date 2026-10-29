import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class DeviceInfoHelper {
  DeviceInfoHelper._();

  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static String _deviceModel = "unknown";
  static String _deviceType = "unknown";
  static String _osVersion = "unknown";
  static String _deviceId = "unknown";

  static Future<void> init() async {
    try {
      if (Platform.isAndroid) {
        final android = await _deviceInfo.androidInfo;
        _deviceModel = android.model;
        _deviceType = "Android";
        _osVersion = android.version.release;
        _deviceId = android.id;
      } else if (Platform.isIOS) {
        final ios = await _deviceInfo.iosInfo;
        _deviceModel = ios.utsname.machine;
        _deviceType = "iOS";
        _osVersion = ios.systemVersion;
        _deviceId = ios.identifierForVendor ?? "ios_unknown";
      }
    } catch (_) {}
  }

  /// ---------------- GETTERS ----------------
  static String get deviceModel => _deviceModel;
  static String get deviceType => _deviceType;
  static String get osVersion => _osVersion;
  static String get deviceId => _deviceId;

  static Map<String, String> get asMap => {
    "DeviceModel": _deviceModel,
    "DeviceType": _deviceType,
    "OsVersion": _osVersion,
    "DeviceId": _deviceId,
  };

  static Future<bool> isHuaweiTablet(BuildContext context) async {
    final androidInfo = await _deviceInfo.androidInfo;

    final manufacturer = androidInfo.manufacturer.toLowerCase();
    final brand = androidInfo.brand.toLowerCase();

    final isHuawei =
        manufacturer.contains('huawei') || brand.contains('huawei');

    final isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;

    debugPrint('Manufacturer: ${androidInfo.manufacturer}');
    debugPrint('Brand: ${androidInfo.brand}');
    debugPrint('Model: ${androidInfo.model}');
    debugPrint('Is Huawei: $isHuawei');
    debugPrint('Is Tablet: $isTablet');

    return isHuawei && isTablet;
  }
}
