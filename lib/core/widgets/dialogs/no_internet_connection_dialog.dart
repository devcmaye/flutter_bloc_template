import 'package:flutter/material.dart';
import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';
import '../../constants/app_strings.dart';
import '../../constants/image_constants.dart';
import '../../routes/app_routes.dart';
import '../../routes/navigator_extenstions.dart';
import '../common/custom_text.dart';
import '../common/cutom_outline_button.dart';

Future<void> showNoInternetConnectionDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return const NoInternetConnectionDialog();
    },
  );
}

class NoInternetConnectionDialog extends StatelessWidget {
  const NoInternetConnectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.whiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Icon
            Image.asset(
              ImageConstants.img_no_internet_connection,
              width: 135,
              height: 135,
            ),

            const SizedBox(height: 10),

            CustomText(
              text: AppStrings.label_no_internet_connection,
              fontSize: AppFontsSize.bodyLarge,
              fontWeight: FontWeight.w600,
              color: AppColor.lightBlackColor,
            ),

            const SizedBox(height: 25),

            CustomText(
              text: AppStrings.label_check_your_network,
              fontSize: AppFontsSize.body,
              color: Colors.grey,
              fontWeight: AppFontWeight.medium,
            ),

            const SizedBox(height: 25),

            CustomOutlineButton(
              text: AppStrings.button_try_again,
              borderColor: AppColor.greyColor,
              textColor: AppColor.greyColor,

              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
