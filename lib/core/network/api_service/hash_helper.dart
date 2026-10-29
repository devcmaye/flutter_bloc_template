import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';

class HashHelper {
  static String generateHash({
    required Map<String, dynamic> data,
    required String secretKey,
  }) {
    final jsonString = jsonEncode(data);

    final key = utf8.encode(secretKey);
    final bytes = utf8.encode(jsonString);

    final hmac = Hmac(sha256, key);
    final digest = hmac.convert(bytes);

    final hashString = base64Encode(digest.bytes);

    debugPrint("PinSinPay HashString -> $hashString");

    return hashString;
  }
}
