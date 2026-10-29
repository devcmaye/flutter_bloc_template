import 'package:flutter/material.dart';

import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final bool showUnderline;
  final double underlineOffset;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = AppColor.lightBlackColor,
    this.fontSize = 14,
    this.fontWeight = AppFontWeight.semiBold,
    this.fontFamily = AppFontFamily.googleSansFlex,
    this.showUnderline = false,
    this.underlineOffset = 3,
    this.width,
    this.height,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamily: fontFamily,
            decoration: showUnderline
                ? TextDecoration.underline
                : TextDecoration.none,
            decorationColor: textColor,
            decorationThickness: 1,
            decorationStyle: TextDecorationStyle.solid,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
