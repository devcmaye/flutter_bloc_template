import 'package:flutter/material.dart';
import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';
import '../../constants/app_strings.dart';
import '../../constants/common_constants.dart';
import '../../routes/app_routes.dart';
import '../../routes/navigator_extenstions.dart';
import '../common/custom_button.dart';
import '../common/custom_text.dart';

Future<void> showUnavailableDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return const ShowUnAvailableDialog();
    },
  );
}

class ShowUnAvailableDialog extends StatelessWidget {
  const ShowUnAvailableDialog({super.key});

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
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.orange,
              size: 36,
            ),

            const SizedBox(height: 16),

            CustomText(
              text: "Unavailable",
              fontSize: AppFontsSize.bodyLarge,
              fontWeight: FontWeight.w600,
              color: Colors.amber,
            ),

            const SizedBox(height: 25),

            CustomText(
              text: "Currently UnAvailable",
              fontSize: AppFontsSize.body,
              color: Colors.grey,
            ),

            const SizedBox(height: 25),

            CustomButton(
              text: AppStrings.button_close,
              textColor: AppColor.whiteColor,
              backgroundColor: AppColor.deepPrimaryColor,
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
