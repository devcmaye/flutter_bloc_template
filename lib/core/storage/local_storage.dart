import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/biometric_service.dart';
import '../enums/auth_enums.dart';
import '../widgets/language_selector.dart';

const String installedKey = "installed_once";
const String phone_number = 'phone_number';
const String kIsFirstTimeSplash = 'is_first_time_splash';
const String biometric_preference = 'biometric_preference';
const String biometric_type = 'biometric_type';
const String user_id = 'user_id';
const String language_type = "language_type";
const String liveness_verify_first_time = "liveness_verify_first_time";

abstract class LocalStorage {
  Future<void> handleFreshInstall();

  // First launch
  Future<bool> isFirstTimeSplash();
  Future<void> setNotFirstTimeSplash();

  //biometric
  Future<BiometricPreference> getBiometricPreference();
  Future<void> setBiometricPreference(BiometricPreference preference);

  Future<BiometricOption> getBiometircType();
  Future<void> setBiometricType(BiometricOption option);

  Future<String> getPhoneNumber();
  Future<void> savePhoneNumber(String phNo);

  Future<String> getUserID();
  Future<void> saveUserID(String userID);

  // Future<String> getPIN();
  // Future<void> savePIN(String pin);

  Future<String> getLanguageType();
  Future<void> saveLanguageType(String languageType);

  Future<bool> isShowLivenessVerify();
  Future<void> setLivenessVerify(bool setLivenessVerify);

  Future<void> clearPrefData();
}

class LocalStorageImpl extends LocalStorage {
  // First Time Launch
  final SharedPreferences sharedPreferences;
  LocalStorageImpl({required this.sharedPreferences});

  Future<void> handleFreshInstall() async {
    final isInstalled = sharedPreferences.getBool(installedKey);

    if (isInstalled == null) {
      // First time OR restored backup
      await sharedPreferences.clear();
      await sharedPreferences.setBool(installedKey, true);
    }
  }

  @override
  Future<bool> isFirstTimeSplash() async {
    return sharedPreferences.getBool(kIsFirstTimeSplash) ?? true;
  }

  @override
  Future<void> setNotFirstTimeSplash() async {
    // await sharedPreferences.clear();
    await sharedPreferences.setBool(kIsFirstTimeSplash, false);
  }

  @override
  Future<BiometricPreference> getBiometricPreference() async {
    final value = sharedPreferences.getString(biometric_preference);
    debugPrint("Retrieved biometric preference from local storage: $value");
    switch (value) {
      case 'enabled':
        return BiometricPreference.enabled;
      case 'disabled':
        return BiometricPreference.disabled;
      default:
        return BiometricPreference.undecided;
    }
  }

  Future<void> setBiometricPreference(BiometricPreference preference) async {
    debugPrint("Saving biometric preference to local storage: $preference");
    await sharedPreferences.setString(biometric_preference, preference.name);
  }

  @override
  Future<BiometricOption> getBiometircType() async {
    final value = sharedPreferences.getString(biometric_type);

    switch (value) {
      case 'fingerprint':
        return BiometricOption.fingerprint;
      case 'face':
        return BiometricOption.face;
      default:
        return BiometricOption.fingerprint;
    }
  }

  @override
  Future<void> setBiometricType(BiometricOption option) {
    return sharedPreferences.setString(biometric_type, option.name);
  }

  @override
  Future<void> savePhoneNumber(String phNo) {
    return sharedPreferences.setString(phone_number, phNo);
  }

  @override
  Future<String> getPhoneNumber() async {
    final ph = sharedPreferences.getString(phone_number);
    return ph ?? ""; // return empty string if null
  }

  // @override
  // Future<String> getPIN() async {
  //   final pin = sharedPreferences.getString(pin_number);
  //   return pin ?? ""; // return empty string if null
  // }

  // @override
  // Future<void> savePIN(String pin) {
  //   return sharedPreferences.setString(pin_number, pin);
  // }

  @override
  Future<String> getUserID() async {
    final userID = sharedPreferences.getString(user_id);
    return userID ?? "";
  }

  @override
  Future<void> saveUserID(String userID) {
    return sharedPreferences.setString(user_id, userID);
  }

  @override
  Future<String> getLanguageType() async {
    final languageType = sharedPreferences.getString(language_type);
    return languageType ?? LanguageType.my.name;
  }

  @override
  Future<void> saveLanguageType(String languageType) {
    return sharedPreferences.setString(language_type, languageType);
  }

  @override
  Future<bool> isShowLivenessVerify() async {
    return sharedPreferences.getBool(liveness_verify_first_time) ?? true;
  }

  @override
  Future<void> setLivenessVerify(bool setLivenessVerify) {
    return sharedPreferences.setBool(
      liveness_verify_first_time,
      setLivenessVerify,
    );
  }

  @override
  Future<void> clearPrefData() async {
    debugPrint("Clearing pref data...");
    await sharedPreferences.remove(user_id);

    // optional: clear biometric
    // await sharedPreferences.remove(biometric_preference);
    // await sharedPreferences.remove(biometric_type);

    debugPrint("Session cleared");
  }
}
