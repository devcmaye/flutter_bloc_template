import 'package:flutter/material.dart';

extension KeyboardUtils on BuildContext {
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }

  Future<void> hideKeyboardWithDelay([
    Duration delay = const Duration(milliseconds: 200),
  ]) async {
    FocusScope.of(this).unfocus();
    await Future.delayed(delay);
  }
}
