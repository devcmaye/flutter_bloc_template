import 'package:flutter/material.dart';

extension FocusExtension on BuildContext {
  void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void nextFocus() {
    FocusScope.of(this).nextFocus();
  }

  void previousFocus() {
    FocusScope.of(this).previousFocus();
  }
}
