import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:in_app_update/in_app_update.dart';

class VersionUpdateService {
  const VersionUpdateService();

  Future<bool> isGooglePlayServicesAvailable() async {
    if (!Platform.isAndroid) {
      return false;
    }

    final result = await GoogleApiAvailability.instance
        .checkGooglePlayServicesAvailability();

    return result == GooglePlayServicesAvailability.success;
  }

  Future<AppUpdateInfo?> checkForUpdate() async {
    try {
      final info = await InAppUpdate.checkForUpdate();

      debugPrint('Update availability: ${info.updateAvailability}');

      debugPrint('Available version code: ${info.availableVersionCode}');

      debugPrint('Immediate update allowed: ${info.immediateUpdateAllowed}');

      debugPrint('Flexible update allowed: ${info.flexibleUpdateAllowed}');

      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        return info;
      }

      return null;
    } catch (e, stackTrace) {
      debugPrint('Check for update failed: $e');
      debugPrintStack(stackTrace: stackTrace);

      return null;
    }
  }

  Future<bool> performImmediateUpdate() async {
    try {
      final result = await InAppUpdate.performImmediateUpdate();

      debugPrint('Immediate update result: $result');

      return result == AppUpdateResult.success;
    } catch (e, stackTrace) {
      debugPrint('Immediate update failed: $e');
      debugPrintStack(stackTrace: stackTrace);

      return false;
    }
  }

  Future<bool> performFlexibleUpdate() async {
    try {
      await InAppUpdate.startFlexibleUpdate();

      await InAppUpdate.completeFlexibleUpdate();

      return true;
    } catch (e, stackTrace) {
      debugPrint('Flexible update failed: $e');
      debugPrintStack(stackTrace: stackTrace);

      return false;
    }
  }
}
