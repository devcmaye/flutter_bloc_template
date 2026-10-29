import 'package:flutter/material.dart';

import 'app_routes.dart';

extension NavigationExtension on BuildContext {
  /// Pop current route
  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  /// Check if can pop
  bool canPop() => Navigator.of(this).canPop();

  // Push named
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  // Push replacement named
  Future<T?> pushReplacementNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushReplacementNamed<T, T>(routeName, arguments: arguments);
  }

  /// Remove all routes and push new route
  Future<T?> pushNamedAndRemoveAll<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
}
