import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';
import '../../constants/app_strings.dart';
import '../../constants/svg_constants.dart';
import '../common/custom_button.dart';
import '../common/custom_text.dart';
import '../common/cutom_outline_button.dart';

Future<void> showAppExitDialog(
  BuildContext context, {
  required VoidCallback onConfirm,
}) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => AppExitDialog(onConfirm: onConfirm),
  );
}

class AppExitDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const AppExitDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              SvgConstants.icon_logout,
              width: 32,
              height: 32,
              colorFilter: ColorFilter.mode(
                AppColor.deepPrimaryColor,
                BlendMode.srcIn,
              ),
            ),

            const SizedBox(height: 18),

            CustomText(
              text: AppStrings.label_exit_title,
              fontSize: AppFontsSize.bodyNormal,
              fontWeight: AppFontWeight.semiBold,
              color: AppColor.blackColor,
            ),

            const SizedBox(height: 15),

            CustomText(
              text: AppStrings.label_exit_body,
              fontSize: AppFontsSize.body,
              fontWeight: AppFontWeight.medium,
              color: AppColor.darkGreyColor,
            ),

            const SizedBox(height: 24),

            /// Buttons
            Row(
              children: [
                Expanded(
                  child: CustomOutlineButton(
                    text: AppStrings.button_exit_cancel,
                    height: 45,
                    borderRadius: 28,
                    borderColor: AppColor.darkGreyColor,
                    textColor: AppColor.darkGreyColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: CustomButton(
                    text: AppStrings.button_exit,
                    height: 45,
                    borderRadius: 28,
                    textColor: AppColor.whiteColor,
                    backgroundColor: AppColor.deepPrimaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onConfirm();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
