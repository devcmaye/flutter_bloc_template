import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for FilteringTextInputFormatter
import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';
import 'custom_text.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final int maxLines;
  final int? maxLength; // Added this
  final String? validatorMessage;
  final TextInputType? keyboardType;
  final String? hint;
  final Icon? suffixIcon;
  final Color? txtFieldBgColor;
  final Color? textColor;
  final Color? txtFieldBorderColor;

  final double borderRadius;
  final FontWeight fontWeight;
  final String fontFamily;
  final double fontSize;
  final Color? cursorColor;
  final bool readOnly;
  final bool disableKeyboard;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    this.label,
    required this.controller,
    this.maxLines = 1,
    this.maxLength, // Added this
    this.validatorMessage,
    this.keyboardType,
    this.hint,
    this.suffixIcon,
    this.txtFieldBgColor,
    this.textColor,
    this.txtFieldBorderColor = AppColor.lightGreyColor,
    this.borderRadius = 12,
    this.fontWeight = AppFontWeight.regular,
    this.fontFamily = AppFontFamily.googleSansFlex,
    this.fontSize = AppFontsSize.body,
    this.cursorColor = AppColor.blackColor,
    this.readOnly = false,
    this.disableKeyboard = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null && label!.trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CustomText(
              text: label!,
              fontWeight: AppFontWeight.regular,
              fontSize: AppFontsSize.bodyLarge,
            ),
          ),

        TextFormField(
          controller: controller,
          maxLines: maxLines,
          maxLength: maxLength, // Set the limit here
          readOnly: readOnly || disableKeyboard,
          keyboardType: disableKeyboard ? TextInputType.none : keyboardType,

          // Added inputFormatters to ensure only numbers are typed if it's a phone/number type
          inputFormatters: keyboardType == TextInputType.number
              ? [FilteringTextInputFormatter.digitsOnly, AmountInputFormatter()]
              : keyboardType == TextInputType.phone
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,

          onTap: () {
            if (disableKeyboard) {
              FocusScope.of(context).unfocus();
            }
            onTap?.call();
          },

          validator: (value) => (value == null || value.isEmpty)
              ? validatorMessage ?? "Required field"
              : null,

          style: TextStyle(
            fontFamily: AppFontFamily.googleSansFlex,
            fontWeight: fontWeight,
            fontSize: AppFontsSize.body,
            height: 1,
            color: readOnly == true
                ? AppColor.blackColor.withOpacity(0.6)
                : textColor ?? AppColor.blackColor,
          ),
          cursorColor: AppColor.lightBlackColor,

          decoration: InputDecoration(
            filled: true,
            fillColor: txtFieldBgColor ?? AppColor.whiteColor,
            suffixIcon: suffixIcon,
            hintText: hint,
            // Hides the "0/6" counter text at the bottom
            counterText: "",
            hintStyle: const TextStyle(
              fontSize: 14,
              color: AppColor.greyBorderColor,
              fontWeight: FontWeight.bold,
              fontFamily: AppFontFamily.googleSansFlex,
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: readOnly == true
                    ? AppColor.lightGreyColor
                    : txtFieldBorderColor!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: readOnly == true
                    ? AppColor.lightGreyColor
                    : txtFieldBorderColor!,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: AppColor.errorColor),
            ),
          ),
        ),
      ],
    );
  }
}

class AmountInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove commas
    String newText = newValue.text.replaceAll(',', '');

    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Convert to number
    final number = int.tryParse(newText);
    if (number == null) return oldValue;

    // Format with commas
    final formatted = _formatNumber(number);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _formatNumber(int number) {
    final str = number.toString();
    final buffer = StringBuffer();

    int count = 0;

    for (int i = str.length - 1; i >= 0; i--) {
      count++;
      buffer.write(str[i]);

      if (count % 3 == 0 && i != 0) {
        buffer.write(',');
      }
    }

    return buffer.toString().split('').reversed.join();
  }
}
