import 'package:flutter/material.dart';

import '../../widgets/dialogs/no_internet_connection_dialog.dart';

class NetworkErrorNotifier {
  NetworkErrorNotifier._();

  static final NetworkErrorNotifier instance = NetworkErrorNotifier._();

  GlobalKey<NavigatorState>? _navigatorKey;

  bool _isShowingNoInternetDialog = false;

  /// Initialize once from MaterialApp
  void initialize(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  /// Show No Internet dialog
  void showNoInternet() {
    if (_isShowingNoInternetDialog) {
      return;
    }

    final context = _navigatorKey?.currentContext;

    if (context == null) {
      return;
    }

    _isShowingNoInternetDialog = true;

    showNoInternetConnectionDialog(context).whenComplete(() {
      _isShowingNoInternetDialog = false;
    });
  }
}
