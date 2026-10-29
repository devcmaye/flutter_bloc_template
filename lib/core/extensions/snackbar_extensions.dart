import 'package:flutter/material.dart';

enum SnackBarType { success, error, info }

extension SnackBarExtension on BuildContext {
  void showSnackBar(
    String message, {
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color backgroundColor;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green;
        break;
      case SnackBarType.error:
        backgroundColor = Colors.red;
        break;
      case SnackBarType.info:
      default:
        backgroundColor = Colors.blue;
    }

    ScaffoldMessenger.of(this).hideCurrentSnackBar(); // hide previous
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
      ),
    );
  }
}
