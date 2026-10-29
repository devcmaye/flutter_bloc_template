import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageKeys {
  static const userId = 'user_id';
  static const sessionId = 'session_id';
  static const pin = 'user_pin';
  static const accessToken = 'access_token';
  static const biometricEnabled = 'biometric_enabled';
}

class SecureStorageService {
  SecureStorageService._();

  static final SecureStorageService instance = SecureStorageService._();

  static const _storage = FlutterSecureStorage();

  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return _storage.read(key: key);
  }

  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
