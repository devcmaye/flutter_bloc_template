import 'package:flutter/material.dart';
import '../../app_config/app_color.dart';
import '../../constants/app_constants_text.dart';
import '../../routes/navigator_extenstions.dart';
import '../common/custom_text.dart';

class CustomConfirmDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String message,

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

          title: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              const SizedBox(width: 8),
              Expanded(child: CustomText(text: title, fontSize: 16)),
            ],
          ),

          content: CustomText(text: message, fontSize: 14),

          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: CustomText(text: "Cancel", color: Colors.black),
              ),
            ),

            //OK BUTTON
            TextButton(
              onPressed: () {
                context.pop();
                if (onOk != null) onOk();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.deepPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: CustomText(
                  text: AppConstantsText.dialog_button_ok,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
