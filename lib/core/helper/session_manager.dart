import 'dart:convert';

import 'package:flutter_bloc_template/core/helper/secure_storage.dart';

class SessionManager {
  SessionManager._();

  static final SessionManager instance = SessionManager._();

  SessionModel? _cachedSession;

  Future<void> saveSession(SessionModel session) async {
    _cachedSession = session;

    await SecureStorageService.instance.write(
      key: SecureStorageKeys.sessionId,
      value: jsonEncode(session.toJson()),
    );
  }

  Future<SessionModel?> getSession() async {
    if (_cachedSession != null) {
      return _cachedSession;
    }

    final json = await SecureStorageService.instance.read(
      key: SecureStorageKeys.sessionId,
    );

    if (json == null) {
      return null;
    }

    _cachedSession = SessionModel.fromJson(jsonDecode(json));

    return _cachedSession;
  }

  Future<void> clear() async {
    _cachedSession = null;
    await SecureStorageService.instance.delete(
      key: SecureStorageKeys.sessionId,
    );
  }

  Future<bool> hasSession() async {
    return await getSession() != null;
  }

  Future<bool> isLoggedIn() async {
    final session = await getSession();

    if (session == null) {
      return false;
    }

    return !session.isExpired;
  }

  Future<String?> getAccessToken() async {
    return (await getSession())?.accessToken;
  }

  Future<String?> getSessionId() async {
    return (await getSession())?.sessionId;
  }
}

class SessionModel {
  final String sessionId;
  final String accessToken;
  final String refreshToken;
  final DateTime expiryAt;

  const SessionModel({
    required this.sessionId,
    required this.accessToken,
    required this.refreshToken,
    required this.expiryAt,
  });

  bool get isExpired {
    return DateTime.now().isAfter(expiryAt);
  }

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      sessionId: json['sessionId'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      expiryAt: DateTime.parse(json['expiryAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sessionId': sessionId,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiryAt': expiryAt.toIso8601String(),
    };
  }
}
