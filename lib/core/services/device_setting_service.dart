import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceSettingsService {
  DeviceSettingsService._();

  static final DeviceSettingsService instance = DeviceSettingsService._();

  static const _channel = MethodChannel('device_settings');

  Future<void> openBiometricSettings() async {
    try {
      await _channel.invokeMethod('openBiometricSettings');
    } on PlatformException catch (e) {
      debugPrint('Failed to open biometric settings: ${e.message}');
    }
  }
}
