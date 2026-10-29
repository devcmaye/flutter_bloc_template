import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../app_config/app_color.dart';
import '../app_config/app_fonts_style.dart';
import 'bottom_sheets/languange_switch_bottom_sheet.dart';
import 'common/custom_text.dart';

enum LanguageType { en, my }

enum LanguageValue { US, MM }

Widget languageSelector({
  required BuildContext context,
  double? borderRadius,
  Color borderColor = const Color(0xFFFDE8E8),
}) {
  return GestureDetector(
    onTap: () => _openLanguageBottomSheet(context),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          bottom: BorderSide(color: AppColor.deepPrimaryColor, width: 2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: context.locale.languageCode == LanguageType.my.name
                ? 'မြန်မာ'
                : 'English',
            fontSize: AppFontsSize.body,
            fontWeight: AppFontWeight.medium,
          ),

          const SizedBox(width: 10),

          Icon(Icons.expand_more, size: 20, color: AppColor.deepPrimaryColor),
        ],
      ),
    ),
  );
}

void _openLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
    ),
    context: context,
    builder: (_) => const LanguangeSwitchBottomSheet(),
  );
}
