import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class NetworkMonitor {
  static StreamSubscription? _subscription;

  static void listen({required CancelToken cancelToken}) {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        if (!cancelToken.isCancelled) {
          cancelToken.cancel('Network disconnected');
        }
      }
    });
  }

  static void dispose() {
    _subscription?.cancel();
  }
}
