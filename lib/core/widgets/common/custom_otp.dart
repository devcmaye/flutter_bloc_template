import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../app_config/app_color.dart';

class CustomOtpStyle {
  static const double _boxSize = 58;

  /// Default box
  static PinTheme pinBox() {
    return PinTheme(
      width: _boxSize,
      height: _boxSize + 4,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF161616),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFCFCFCF)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }

  static PinTheme focusedPinBox() {
    return pinBox().copyWith(
      decoration: pinBox().decoration!.copyWith(
        border: Border.all(color: AppColor.primaryColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }

  /// Submitted box
  static PinTheme submittedPinBox() {
    return pinBox().copyWith(
      decoration: pinBox().decoration!.copyWith(
        border: Border.all(color: AppColor.primaryColor),
      ),
    );
  }
}
