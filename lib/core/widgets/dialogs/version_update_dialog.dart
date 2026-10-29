import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app_config/app_color.dart';
import '../../app_config/app_fonts_style.dart';
import '../../constants/app_constants_text.dart';
import '../../constants/app_strings.dart';
import '../../constants/image_constants.dart';
import '../../extensions/toast_message_extensions.dart';
import '../../utils/app_version/version_update_service.dart';
import '../common/custom_text.dart';
import '../common/custom_text_button.dart';
import '../dotted_divider.dart';
import 'custom_alert_dialog.dart';

class VersionUpdateDialog extends StatelessWidget {
  final String message;
  final String latestVersion;
  final String storeUrl;
  final String isForcedUpdate;
  final String isUpdateAvailable;

  const VersionUpdateDialog({
    super.key,
    required this.message,
    required this.latestVersion,
    required this.storeUrl,
    required this.isForcedUpdate,
    required this.isUpdateAvailable,
  });

  Future<void> _updateApp(BuildContext context) async {
    final url = storeUrl;

    final versionUpdateService = VersionUpdateService();
    final isSupported = await versionUpdateService
        .isGooglePlayServicesAvailable();

    if (isSupported) {
      if (Platform.isAndroid) {
        _inAppUpdate(context, url);
      } else {
        //ios can't support inapp update
        _routeApp(context, url);
      }
    } else {
      _showError(context, AppStrings.error_message_unsupport_version_update);
    }
  }

  Future<void> _routeApp(BuildContext context, String baseURL) async {
    final url = storeUrl;
    if (url.isEmpty) {
      return;
    }

    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  //in app update
  Future<void> _inAppUpdate(BuildContext context, String baseURL) async {
    final versionUpdateService = VersionUpdateService();
    final updateInfo = await versionUpdateService.checkForUpdate();

    if (updateInfo == null) {
      "No Google Play update available.".showToast(context);
      return;
    }

    if (updateInfo.immediateUpdateAllowed) {
      await versionUpdateService.performImmediateUpdate();
    } else {
      "Immediate update is not allowed by Google Play.".showToast(context);
    }
  }

  void _showError(BuildContext context, String message) {
    CustomAlertDialog.show(
      context: context,
      title: AppConstantsText.dialog_title_error,
      message: message,
      isSuccess: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 48),
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(46),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 32),

              SizedBox(
                width: 50,
                height: 100,
                child: Image.asset(
                  ImageConstants.img_version_update,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 0),

              CustomText(
                text: AppStrings.label_update_notice,
                fontSize: AppFontsSize.appbar_title,
                fontWeight: AppFontWeight.semiBold,
                color: AppColor.lightBlackColor,
              ),

              const SizedBox(height: 22),

              // Description
              CustomText(
                text: message,
                fontSize: AppFontsSize.body,
                fontWeight: AppFontWeight.medium,
                color: AppColor.darkGreyColor,
              ),

              const SizedBox(height: 30),

              DottedDivider(),

              SizedBox(height: 10),

              CustomTextButton(
                text: AppStrings.button_update_now,
                onPressed: () {
                  _updateApp(context);
                },
                textColor: AppColor.redColor,
                fontSize: AppFontsSize.appbar_body,
                fontWeight: AppFontWeight.semiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
