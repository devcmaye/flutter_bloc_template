import 'dart:async';

import 'package:flutter/material.dart';
import '../../app_config/app_fonts_style.dart';
import '../../constants/app_strings.dart';

import '../common/custom_button.dart';
import '../common/custom_pin_input.dart';
import '../common/custom_text.dart';
import '../../app_config/app_color.dart';

class PinBoxBottomSheet extends StatefulWidget {
  final Function(String) onConfirm;
  final VoidCallback onCancel;

  const PinBoxBottomSheet({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  State<PinBoxBottomSheet> createState() => _PinBoxBottomSheetState();
}

class _PinBoxBottomSheetState extends State<PinBoxBottomSheet> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();
  String pin = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        padding: EdgeInsets.only(
          left: 18,
          right: 18,
          top: 18,
          bottom: MediaQuery.of(context).viewInsets.bottom + 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: widget.onCancel,
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.close, color: AppColor.redColor, size: 28),
              ),
            ),

            CustomText(
              text: AppStrings.security_pin,
              fontSize: AppFontsSize.bodyNormal,
              fontWeight: AppFontWeight.semiBold,
            ),
            const SizedBox(height: 18),

            CustomText(
              text: AppStrings.label_normal_password_label,
              fontSize: AppFontsSize.body,
              fontWeight: AppFontWeight.light,
            ),

            const SizedBox(height: 30),

            Align(
              alignment: Alignment.center,
              child: CustomPinInput(
                label: AppStrings.label_new_pin,
                controller: _pinController,
                focusNode: _pinFocusNode,
                isLableShow: false,
                autofocus: false,
                isPinHide: true,
                onCompleted: (_) {},
                onChanged: (value) {
                  if (value.length == 6) {
                    pin = value;
                  }
                },
              ),
            ),
            const SizedBox(height: 30),

            // GestureDetector(
            //   onTap: () {
            //     context.pushNamed(AppRoutes.forget_pin_alert);
            //   },
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: CustomText(
            //       text: AppStrings.text_button_forgot_your_pin,
            //       color: AppColor.deepPrimaryColor,
            //       fontWeight: AppFontWeight.bold,
            //       isUnderline: true,
            //     ),
            //   ),
            // ),

            // SizedBox(height: 30),
            CustomButton(
              borderRadius: 8,
              text: AppStrings.button_confirm,
              onPressed: () {
                widget.onConfirm(pin);
              },
            ),
            // const SizedBox(height: 10),
            // CustomOutlineButton(
            //   borderRadius: 8,
            //   text: AppStrings.button_cancel,
            //   onPressed: widget.onCancel,
            // ),
            const SizedBox(height: 75),
          ],
        ),
      ),
    );
  }
}
