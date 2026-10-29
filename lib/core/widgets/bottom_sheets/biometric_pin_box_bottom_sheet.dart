import 'dart:async';

import 'package:flutter/material.dart';
import '../../app_config/app_fonts_style.dart';
import '../../constants/app_strings.dart';
import '../common/custom_pin_input.dart';
import '../common/custom_text.dart';
import '../../app_config/app_color.dart';

class BiometricPinBoxBottomSheet extends StatefulWidget {
  final Function(String) onConfirm;

  const BiometricPinBoxBottomSheet({super.key, required this.onConfirm});

  @override
  State<BiometricPinBoxBottomSheet> createState() => _PinBoxBottomSheetState();
}

class _PinBoxBottomSheetState extends State<BiometricPinBoxBottomSheet> {
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
          top: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 70,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColor.greyBorderColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: CustomText(
                text: AppStrings.security_pin,
                fontSize: AppFontsSize.bodyNormal,
                fontWeight: AppFontWeight.semiBold,
              ),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomText(
                text: AppStrings.label_normal_password_label,
                fontSize: AppFontsSize.body,
                fontWeight: AppFontWeight.light,
              ),
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
                onCompleted: (pin) {
                  widget.onConfirm(pin);
                },
                onChanged: (value) {
                  if (value.length == 6) {
                    pin = value;
                  }
                },
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
