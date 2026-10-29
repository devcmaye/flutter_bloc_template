import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app_config/app_color.dart';
import '../../constants/app_constants_text.dart';
import '../../constants/svg_constants.dart';
import '../common/custom_text.dart';

class BiometricAlertDialog {
  static void show({
    required BuildContext context,
    VoidCallback? onOk,
    VoidCallback? onCancel,
    bool barrierDismissible = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top icon
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.deepPrimaryColor.withAlpha(26),
                  ),
                  padding: const EdgeInsets.all(16),

                  child: SvgPicture.asset(
                    SvgConstants.icon_biometric_icon,
                    width: 48,
                    height: 48,
                    colorFilter: ColorFilter.mode(
                      AppColor.deepPrimaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  // child: Icon(
                  //   Icons.face,
                  //   size: 48,
                  //   color: AppColor.deepPrimaryColor,
                  // ),
                ),

                const SizedBox(height: 16),

                // Title
                CustomText(
                  text: "Enable Biometric Login",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  // textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),

                // Message
                CustomText(
                  text:
                      "You can use your biometric to quickly login. Do you want to enable it?",
                  fontSize: 14,
                  color: AppColor.greyColor,
                  // textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onCancel,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColor.greyColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: CustomText(
                          text: AppConstantsText.dialog_button_cancel,
                          color: AppColor.greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onOk,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.deepPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: CustomText(
                          text: AppConstantsText.dialog_button_ok,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
