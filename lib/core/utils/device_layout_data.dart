import 'package:flutter/material.dart';

import '../enums/app_enums.dart';

class DeviceLayoutData {
  DeviceLayoutData._();
  static final DeviceLayoutData instance = DeviceLayoutData._();

  double screenHeight = 0;
  double screenWidth = 0;
  Orientation orientation = Orientation.portrait;
  DeviceType deviceType = DeviceType.Mobile;

  /// Call inside any widget with context
  void init(BuildContext context) {
    final media = MediaQuery.of(context);

    orientation = media.orientation;
    screenWidth = media.size.width;
    screenHeight = media.size.height;
    deviceType = _resolveDeviceType(screenWidth);
  }

  DeviceType _resolveDeviceType(double width) {
    if (width >= 950) return DeviceType.Desktop;
    if (width >= 600) return DeviceType.Tablet;
    return DeviceType.Mobile;
  }

  /// ---------------- FONT HELPERS ----------------
  double responsiveFont(double size) {
    const baseWidth = 375;
    double scale = (screenWidth / baseWidth).clamp(1.0, 1.4);
    return size * scale;
  }

  double get tinyText => responsiveFont(12);
  double get smallText => responsiveFont(14);
  double get mediumText => responsiveFont(16);
  double get largeText => responsiveFont(20);
  double get extraLargeText => responsiveFont(24);
}
