import 'package:flutter/material.dart';
import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final double buttonPadding;
  final bool isUseGradient;
  final bool fitContent;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.borderRadius = 12,
    this.backgroundColor,
    this.borderColor = AppColor.deepPrimaryColor,
    this.textColor = AppColor.textColorBrown,
    this.fontSize = 14,
    this.buttonPadding = 10,
    this.fontWeight = AppFontWeight.semiBold,
    this.fontFamily = AppFontFamily.googleSansFlex,
    this.isUseGradient = true,
    this.fitContent = false,
  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = width ?? (fitContent ? null : double.infinity);

    return SizedBox(
      width: buttonWidth,
      height: height ?? 45,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: buttonPadding),
          decoration: BoxDecoration(
            color: isUseGradient ? null : backgroundColor,

            gradient: isUseGradient
                ? LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [AppColor.primaryColor, AppColor.deepPrimaryColor],
                  )
                : null,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor ?? Colors.transparent),
          ),

          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            onTap: onPressed,
            child: Center(
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
          ),
        ),
      ),
    );
  }
}
