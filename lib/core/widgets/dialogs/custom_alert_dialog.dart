import 'package:flutter/material.dart';
import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';
import '../../constants/app_constants_text.dart';
import '../../routes/navigator_extenstions.dart';
import '../common/custom_button.dart';
import '../common/custom_text.dart';

class CustomAlertDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    required bool isSuccess,
    VoidCallback? onOk,
    bool barrierDismissible = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Center(
            child: Icon(
              isSuccess ? Icons.check_circle : Icons.error,
              color: isSuccess ? Colors.green : AppColor.darkRedColor,
              size: 35,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // CustomText(
                //   text: isSuccess
                //       ? AppConstantsText.dialog_title_success
                //       : AppConstantsText.error_message_something_went_wrong,
                //   fontSize: AppFontsSize.bodyNormal,
                //   color: isSuccess ? Colors.green : AppColor.blackColor,
                //   fontWeight: AppFontWeight.medium,
                // ),
                CustomText(
                  text: message,
                  fontSize: AppFontsSize.appbar_sub_title,
                  align: TextAlign.center,
                  color: AppColor.blackColor,
                  fontWeight: AppFontWeight.regular,
                ),
              ],
            ),
          ),

          actions: [
            SizedBox(height: 5),
            CustomButton(
              text: AppConstantsText.dialog_button_close,
              textColor: AppColor.whiteColor,
              backgroundColor: isSuccess ? Colors.green : AppColor.darkRedColor,
              isUseGradient: false,
              borderColor: isSuccess ? Colors.green : AppColor.darkRedColor,
              borderRadius: 16,

              onPressed: () {
                context.pop();
                if (onOk != null) onOk();
              },
            ),
          ],
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import '../../app_config/app_color.dart';
// import '../../constants/app_constants_text.dart';
// import '../../routes/navigator_extenstions.dart';
// import '../common/custom_text.dart';

// class CustomAlertDialog {
//   static void show({
//     required BuildContext context,
//     required String title,
//     required String message,
//     required bool isSuccess,
//     VoidCallback? onOk,
//     bool barrierDismissible = false,
//   }) {
//     showDialog(
//       context: context,
//       barrierDismissible: barrierDismissible,
//       builder: (_) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           title: Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   isSuccess ? Icons.check_circle : Icons.error,
//                   color: isSuccess ? Colors.green : Colors.red,
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(child: CustomText(text: title, fontSize: 16)),
//               ],
//             ),
//           ),
//           content: CustomText(text: message, fontSize: 14),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 context.pop();
//                 if (onOk != null) onOk();
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: AppColor.deepPrimaryColor,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 10,
//                   ),
//                   child: CustomText(
//                     text: AppConstantsText.dialog_button_ok,
//                     color: AppColor.whiteColor,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
