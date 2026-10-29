import 'package:flutter/widgets.dart';

class AppLifecycleService with WidgetsBindingObserver {
  static final AppLifecycleService _instance = AppLifecycleService._internal();

  factory AppLifecycleService() => _instance;

  AppLifecycleService._internal();

  VoidCallback? onBackground;
  VoidCallback? onForeground;

  void init() {
    WidgetsBinding.instance.addObserver(this);
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        // App goes to background (home button / screen off)
        onBackground?.call();
        break;

      case AppLifecycleState.resumed:
        // App comes back to foreground
        onForeground?.call();
        break;

      case AppLifecycleState.inactive:
        // temporary interruption (call, notification)
        break;

      case AppLifecycleState.detached:
        // app is killed
        break;

      case AppLifecycleState.hidden:
        break;
    }
  }
}
