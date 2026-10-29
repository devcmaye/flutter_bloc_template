import 'package:flutter/material.dart';
import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';
import '../../constants/app_strings.dart';
import '../../constants/common_constants.dart';
import '../../routes/app_routes.dart';
import '../../routes/navigator_extenstions.dart';
import '../common/custom_button.dart';
import '../common/custom_text.dart';

Future<void> showSessionExpiredDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return const SessionExpiredDialog();
    },
  );
}

class SessionExpiredDialog extends StatelessWidget {
  const SessionExpiredDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Icon
            const Icon(Icons.access_time, color: Colors.red, size: 36),

            const SizedBox(height: 16),

            CustomText(
              text: "Session Expired",
              fontSize: AppFontsSize.bodyLarge,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),

            const SizedBox(height: 25),

            CustomText(
              text: AppStrings.error_message_session_expired,
              fontSize: AppFontsSize.body,
              color: Colors.grey,
            ),

            const SizedBox(height: 25),

            CustomButton(
              text: AppStrings.button_close,
              textColor: AppColor.whiteColor,
              isUseGradient: false,
              backgroundColor: AppColor.redColor,
              onPressed: () {
                context.pushNamedAndRemoveAll(
                  AppRoutes.login,
                  arguments: {ArgumentConstant.isShowBack: false},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
