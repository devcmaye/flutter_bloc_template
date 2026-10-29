import 'package:flutter/material.dart';

import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double borderRadius;
  final Color? borderColor;
  final Color textColor;
  final double fontSize;
  final double borderStoke;
  final FontWeight fontWeight;
  final String fontFamily;

  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.borderRadius = 40,
    this.borderColor,
    this.textColor = AppColor.deepPrimaryColor, // Default text matches border
    this.fontSize = 14,
    this.borderStoke = 1,
    this.fontWeight = FontWeight.bold,
    this.fontFamily = AppFontFamily.googleSansFlex,
  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = width ?? double.infinity;

    return SizedBox(
      width: buttonWidth,
      height: height ?? 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          // Uses the provided borderColor or defaults to your app's primary color
          side: BorderSide(
            color: borderColor ?? AppColor.deepPrimaryColor,
            width: borderStoke,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          // Ensures the splash color feels natural
          foregroundColor: (borderColor ?? AppColor.deepPrimaryColor)
              .withOpacity(0.1),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
  }
}
