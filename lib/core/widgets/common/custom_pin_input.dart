import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';
import 'custom_text.dart';

class CustomPinInput extends StatelessWidget {
  final String label;
  final bool isLableShow;
  final int length;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String value) onCompleted;
  final Function(String value) onChanged;
  final bool isPinHide;
  final bool autofocus;

  ///NEW (size control)
  final double boxWidth;
  final double boxHeight;
  final double fontSize;

  const CustomPinInput({
    super.key,
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.onCompleted,
    required this.onChanged,
    this.isLableShow = true,
    this.isPinHide = false,

    this.length = 6,
    this.autofocus = true,

    /// default values (can override)
    this.boxWidth = 45,
    this.boxHeight = 50,
    this.fontSize = 18,
  });

  /// build dynamic theme here (instead of external style)
  PinTheme _buildPinTheme() {
    return PinTheme(
      width: boxWidth,
      height: boxHeight,
      textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final baseTheme = _buildPinTheme();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isLableShow) ...[
          /// Label
          CustomText(
            text: label,
            fontSize: AppFontsSize.body,
            fontFamily: AppFontFamily.googleSansFlex,
            fontWeight: AppFontWeight.medium,
          ),

          const SizedBox(height: 10),
        ],

        /// PIN Input
        Pinput(
          controller: controller,
          focusNode: focusNode,
          length: length,
          autofocus: autofocus,
          keyboardType: TextInputType.number,

          inputFormatters: [FilteringTextInputFormatter.digitsOnly],

          obscureText: isPinHide,
          obscuringCharacter: '●',

          /// use dynamic theme
          defaultPinTheme: baseTheme,
          focusedPinTheme: baseTheme.copyWith(
            decoration: baseTheme.decoration!.copyWith(
              border: Border.all(color: AppColor.deepPrimaryColor),
            ),
          ),
          submittedPinTheme: baseTheme.copyWith(
            decoration: baseTheme.decoration!.copyWith(
              color: AppColor.whiteColor,
            ),
          ),
          onChanged: onChanged,
          onCompleted: onCompleted,
        ),
      ],
    );
  }
}
