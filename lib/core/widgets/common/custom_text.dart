import 'package:flutter/material.dart';
import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';
import '../../constants/common_constants.dart';
import '../../utils/device_layout_data.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextOverflow textOverflow;
  final double height;
  final TextAlign? align;
  final bool readOnly;
  final bool isUnderline;
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w300,
    this.fontFamily = AppFontFamily.googleSansFlex,
    this.textOverflow = TextOverflow.visible,
    this.height = 1.3,
    this.align,
    this.readOnly = false,
    this.isUnderline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: DeviceLayoutData.instance.responsiveFont(fontSize),
        // fontSize: fontSize,
        decoration: isUnderline
            ? TextDecoration.underline
            : TextDecoration.none,
        decorationColor: color ?? AppColor.blackColor,
        color: color ?? AppColor.blackColor,
        height: height,
        fontFamily: CommonConstants.language == 'my_MM'
            ? AppFontFamily.notoSansMyanmar
            : AppFontFamily.googleSansFlex,
        fontWeight: fontWeight,
        overflow: textOverflow,
      ),
    );
  }
}
