import 'dart:io';

import 'package:local_auth/local_auth.dart';

// biometric_service.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum BiometricOption { fingerprint, face }

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();
  static const MethodChannel _channel = MethodChannel('biometric_channel');

  //supprot biometric
  Future<bool> isSupported() async {
    return await _auth.canCheckBiometrics;
  }

  //enroll biometric
  Future<bool> hasEnrolledBiometric() async {
    final biometrics = await _auth.getAvailableBiometrics();
    return biometrics.isNotEmpty;
  }

  Future<bool> authenticate(String? localicationReason) async {
    try {
      return await _auth.authenticate(
        localizedReason: localicationReason ?? "Login with Biometric",
        biometricOnly: true,
        persistAcrossBackgrounding: true,
      );
    } on LocalAuthException catch (e) {
      debugPrint(
        'Biometric authentication error: ${e.code.name}: ${e.description}',
      );

      return false;
    } catch (e) {
      debugPrint('Biometric authentication error: $e');
      return false;
    }
  }
}
