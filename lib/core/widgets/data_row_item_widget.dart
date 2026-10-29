import 'package:flutter/material.dart';

import '../app_config/app_color.dart';
import '../app_config/app_fonts_style.dart';
import 'common/custom_text.dart';

class DataRowItemWidget extends StatelessWidget {
  final String title;
  final String value;

  final Color? titleColor;
  final Color? valueColor;

  final FontWeight? titleWeight;
  final FontWeight? valueWeight;

  final double? titleFontSize;
  final double? valueFontSize;

  final EdgeInsetsGeometry padding;

  const DataRowItemWidget({
    super.key,
    required this.title,
    required this.value,
    this.titleColor,
    this.valueColor,
    this.titleWeight,
    this.valueWeight,
    this.titleFontSize,
    this.valueFontSize,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Expanded(
            flex: 4,
            child: CustomText(
              text: title,
              fontSize: titleFontSize ?? AppFontsSize.body,
              fontWeight: titleWeight ?? AppFontWeight.light,
              color: titleColor ?? AppColor.lightBlackColor,
            ),
          ),

          const SizedBox(width: 10),

          /// VALUE
          Expanded(
            flex: 6,
            child: CustomText(
              text: value,
              align: TextAlign.right,
              fontSize: valueFontSize ?? AppFontsSize.body,
              fontWeight: valueWeight ?? AppFontWeight.medium,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
