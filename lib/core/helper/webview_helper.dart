import 'package:flutter/services.dart';

class WebViewProviderInfo {
  final bool supported;
  final String? packageName;
  final String? versionName;
  final int? versionCode;

  const WebViewProviderInfo({
    required this.supported,
    this.packageName,
    this.versionName,
    this.versionCode,
  });

  factory WebViewProviderInfo.fromMap(Map<dynamic, dynamic> map) {
    return WebViewProviderInfo(
      supported: map['supported'] as bool? ?? false,
      packageName: map['packageName'] as String?,
      versionName: map['versionName'] as String?,
      versionCode: map['versionCode'] as int?,
    );
  }
}

class WebViewProviderChecker {
  static const MethodChannel _channel = MethodChannel('webview_provider');

  static Future<WebViewProviderInfo> getProvider() async {
    final result = await _channel.invokeMethod('getWebViewProvider');

    return WebViewProviderInfo.fromMap(result);
  }
}
