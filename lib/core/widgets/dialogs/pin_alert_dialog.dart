import 'package:flutter/material.dart';
import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';
import '../../app_config/app_utils.dart';
import '../../constants/app_strings.dart';
import '../../constants/common_constants.dart';
import '../../routes/app_routes.dart';
import '../../routes/navigator_extenstions.dart';
import '../common/custom_pin_input.dart';
import '../common/custom_text.dart';

enum PinAlertType { Transfer, QRGenerate, PensionToWallet }

class PinDialog {
  static Future<void> show({
    required BuildContext context,
    required String transferUserName,
    required String amount,
    required PinAlertType pinType,
    ValueChanged<String>? onComplete,
    ValueChanged<String>? onChange,

    bool barrierDismissible = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => PinAlertDialog(
        transferUserName: transferUserName,
        amount: amount,
        pinType: pinType,
        onComplete: onComplete,
        onChange: onChange,
      ),
    );
  }
}

class PinAlertDialog extends StatefulWidget {
  final String transferUserName;
  final String amount;
  final PinAlertType pinType;
  final ValueChanged<String>? onComplete;
  final ValueChanged<String>? onChange;

  const PinAlertDialog({
    super.key,
    required this.transferUserName,
    required this.amount,
    required this.pinType,
    this.onComplete,
    this.onChange,
  });

  @override
  State<PinAlertDialog> createState() => _PinAlertDialogState();
}

class _PinAlertDialogState extends State<PinAlertDialog> {
  late TextEditingController _pinController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Close button
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 5),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, color: AppColor.redColor, size: 22),
                ),
              ),
            ),

            const SizedBox(height: 10),

            widget.pinType == PinAlertType.Transfer
                ?
                  /// Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Transfer to",
                        fontSize: AppFontsSize.body,
                        fontWeight: AppFontWeight.medium,
                      ),
                      const SizedBox(width: 4),
                      CustomText(
                        text: widget.transferUserName,
                        fontSize: AppFontsSize.body,
                        fontWeight: AppFontWeight.medium,
                        color: AppColor.deepPrimaryColor,
                      ),
                    ],
                  )
                : widget.pinType == PinAlertType.QRGenerate
                ? CustomText(
                    text: "Enter PIN for QR Cashout",
                    fontSize: AppFontsSize.body,
                    fontWeight: AppFontWeight.medium,
                    color: AppColor.blackColor,
                  )
                : CustomText(
                    text: "Pension to Wallet",
                    fontSize: AppFontsSize.body,
                    fontWeight: AppFontWeight.medium,
                    color: AppColor.blackColor,
                  ),

            const SizedBox(height: 20),

            /// Amount
            CustomText(
              text: "${widget.amount} MMK",
              fontSize: AppFontsSize.h1,
              fontWeight: AppFontWeight.medium,
            ),

            const SizedBox(height: 10),

            /// PIN Card
            _buildPinInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildPinInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

      child: CustomPinInput(
        label: AppStrings.label_confirm_pin,
        controller: _pinController,
        focusNode: _focusNode,
        isLableShow: false,
        isPinHide: true,
        onCompleted: (pin) {
          FocusScope.of(context).unfocus();
          AppUtils.hideKeyboard(context);

          if (widget.onComplete != null) {
            context.pop();
            widget.onComplete!(pin);
          }
        },
        onChanged: (pin) {
          if (widget.onChange != null) {
            widget.onChange!(pin);
          }
        },
      ),
    );
  }
}
