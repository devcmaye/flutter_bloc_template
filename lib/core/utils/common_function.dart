import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../constants/app_strings.dart';

class CommonFunction {
  // valid phone number
  static bool isValidPhone(String phone) {
    final cleaned = phone.trim().replaceAll(RegExp(r'[\s-]'), '');
    final regExp = RegExp(r'^(09\d{7,9}|9\d{7,9}|\+959\d{7,9})$');
    return regExp.hasMatch(cleaned);
  }

  //09*******2620
  static String maskPhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 6) return phoneNumber;
    String start = phoneNumber.substring(0, 2);
    String end = phoneNumber.substring(phoneNumber.length - 4);
    String masking = '*' * (phoneNumber.length - 6);

    return '$start$masking$end';
  }

  //image to base64
  static Future<String?> convertImageToBase64(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      return base64Encode(bytes);
    } catch (e) {
      debugPrint("Error converting image: $e");
      return null;
    }
  }

  //video to base64
  static Future<String?> convertVideoToBase64(File videoFile) async {
    try {
      // 1. Read the file as bytes
      List<int> videoBytes = await videoFile.readAsBytes();

      // 2. Encode bytes to base64 string
      String base64Video = base64Encode(videoBytes);

      return base64Video;
    } catch (e) {
      debugPrint("Error converting video: $e");
      return null;
    }
  }

  //Cham Myae → Cham
  static String getDisplayName(String fullName) {
    if (fullName.trim().isEmpty) return "";

    List<String> parts = fullName.trim().split(" ");
    if (parts.length > 1) {
      return parts.first;
    }
    String first = parts.first;
    return first.length > 6 ? first.substring(0, 6) : first;
  }

  //greeding
  static String getGreeting() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return AppStrings.label_welcome_good_morning;
    } else if (hour >= 12 && hour < 17) {
      return AppStrings.label_welcome_good_afternoon;
    } else if (hour >= 17 && hour < 20) {
      return AppStrings.label_welcome_good_evening;
    } else {
      return AppStrings.label_welcome_good_night;
    }
  }

  /// 300000 / "1018183"  /300,000 -> "300,000"
  static String currencyFormatter(dynamic amount, {bool isShowMMK = true}) {
    if (amount == null) {
      return isShowMMK ? "0 MMK" : "0";
    }

    num value;

    if (amount is num) {
      value = amount;
    } else {
      final cleaned = amount.toString().replaceAll(RegExp(r'[^0-9.-]'), '');

      value = num.tryParse(cleaned) ?? 0;
    }

    final formatter = NumberFormat('#,##0');

    final formatted = formatter.format(value);

    return isShowMMK ? '$formatted MMK' : formatted;
  }

  // "2,000,120" /  "2000"/  "100.00 MMK"/ "MMK 100.50" / "2,000.75 MMK" /".50" => double value
  static double parseToDouble(dynamic value) {
    if (value == null) return 0.0;

    String cleanString = value.toString();

    // Keep only digits, decimal point and minus sign
    cleanString = cleanString.replaceAll(RegExp(r'[^0-9.-]'), '');

    // Handle values like ".50"
    if (cleanString.startsWith('.')) {
      cleanString = '0$cleanString';
    }

    return double.tryParse(cleanString) ?? 0.0;
  }

  //100,000 .00 , "0.00" , ".00" => int
  static int parseToInteger(dynamic value) {
    if (value == null) return 0;

    String cleanString = value.toString().replaceAll(',', '').trim();

    if (cleanString.startsWith('.')) {
      cleanString = '0$cleanString';
    }
    return (double.tryParse(cleanString) ?? 0.0).toInt();
  }

  //BroupByYearMonth
  // static List<TransactionMonthGroup> groupByMonthWithTotal(
  //   List<WalletTransaction> transactions,
  // ) {
  //   final Map<String, List<WalletTransaction>> grouped = {};

  //   for (final txn in transactions) {
  //     final date = DateTime.tryParse(txn.createDate);
  //     if (date == null) continue;

  //     final key = DateFormat('yyyy-MM').format(date); // for sorting
  //     grouped.putIfAbsent(key, () => []).add(txn);
  //   }

  //   final List<TransactionMonthGroup> result = [];

  //   final sortedKeys = grouped.keys.toList()
  //     ..sort((a, b) => b.compareTo(a)); // latest first

  //   for (final key in sortedKeys) {
  //     final items = grouped[key]!;

  //     double total = 0;
  //     for (final txn in items) {
  //       total += double.tryParse(txn.netAmount) ?? 0;
  //     }

  //     final date = DateTime.parse("$key-01");
  //     final label = DateFormat('MMMM, yyyy').format(date);

  //     result.add(
  //       TransactionMonthGroup(
  //         month: label,
  //         totalAmount: total,
  //         transactions: items,
  //       ),
  //     );
  //   }

  //   return result;
  // }

  // Convert MM to ENG  for NRC Burmese
  static String convertToEnglishNumber(String input) {
    const myanmarDigits = ['၀', '၁', '၂', '၃', '၄', '၅', '၆', '၇', '၈', '၉'];
    const englishDigits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    for (int i = 0; i < myanmarDigits.length; i++) {
      input = input.replaceAll(myanmarDigits[i], englishDigits[i]);
    }

    return input;
  }

  // 1234 5678 9012 3456
  static String formatAccount(String input) {
    final buffer = StringBuffer();

    for (int i = 0; i < input.length; i++) {
      buffer.write(input[i]);

      // add space after every 4 characters (except last)
      if ((i + 1) % 4 == 0 && i != input.length - 1) {
        buffer.write(' ');
      }
    }

    return buffer.toString();
  }

  //  12/AHLANA(N)898969  => 12,AHLANA,N,898969

  static List<String> parseNrc(String nrc) {
    final parts = nrc.split('/');

    final stateCode = parts[0]; // 12

    final remaining = parts[1];

    final regex = RegExp(r'^([A-Z]+)\((.*?)\)(\d+)$');
    final match = regex.firstMatch(remaining);

    if (match == null) {
      return [];
    }

    final township = match.group(1); // AHLANA
    final type = match.group(2); // N
    final number = match.group(3); // 898969

    return [stateCode, township ?? '', type ?? '', number ?? ''];
  }

  // >= 1000 m → 1.2 km
  static String formatDistance(dynamic distance) {
    final meters = double.tryParse(distance.toString()) ?? 0;

    if (meters >= 1000) {
      final kilometers = meters / 1000;

      return '${kilometers.toStringAsFixed(1)} km from your location';
    }

    return '${meters.toStringAsFixed(0)} m from your location';
  }
}
