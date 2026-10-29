import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:location/location.dart';

class LocationService {
  final location = Location();

  Future<bool> checkAndRequestLocationService() async {
    final enabled = await location.serviceEnabled();

    if (enabled) {
      return true;
    }
    try {
      final result = await location.requestService();

      if (result) {
        return true;
      }
    } catch (_) {
      //  requestService is unavailable
    }

    if (Platform.isAndroid) await openLocationSettings();

    return false;
  }

  Future<void> openLocationSettings() async {
    const intent = AndroidIntent(
      action: 'android.settings.LOCATION_SOURCE_SETTINGS',
    );

    await intent.launch();
  }

  Future<LocationData?> getCurrentLocation() async {
    PermissionStatus permission = await location.hasPermission();

    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
    }

    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.grantedLimited) {
      return null;
    }

    return await location.getLocation();
  }
}
