import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

extension SystemSettingsExtension on BuildContext {
  /// Open Security / Biometrics / Screen lock settings
  void openSecuritySettings() {
    AppSettings.openAppSettings(type: AppSettingsType.security);
  }

  /// Open App Settings (permissions, storage, etc.)
  void openAppSettingsPage() {
    AppSettings.openAppSettings();
  }

  /// Open Storage settings
  void openStorageSettings() {
    AppSettings.openAppSettings(type: AppSettingsType.internalStorage);
  }

  /// Open Notification settings
  void openNotificationSettings() {
    AppSettings.openAppSettings(type: AppSettingsType.notification);
  }

  /// Open Location settings
  void openLocationSettings() {
    AppSettings.openAppSettings(type: AppSettingsType.location);
  }

  /// Open Wi-Fi settings
  void openWifiSettings() {
    AppSettings.openAppSettings(type: AppSettingsType.wifi);
  }

  /// Open Bluetooth settings
  void openBluetoothSettings() {
    AppSettings.openAppSettings(type: AppSettingsType.bluetooth);
  }
}
