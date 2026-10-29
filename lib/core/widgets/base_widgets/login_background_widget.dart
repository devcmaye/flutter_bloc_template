import 'package:flutter/material.dart';

import '../../../../core/constants/image_constants.dart';
import '../../../../core/extensions/media_query_extension.dart';
import '../../../../core/widgets/language_selector.dart';

class LoginBackgroundWidget extends StatelessWidget {
  const LoginBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight,

      child: Stack(
        children: [
          Image.asset(
            ImageConstants.login_background_ui_one,
            width: double.infinity,
            height: context.screenHeight * 0.36,
            fit: BoxFit.fill,
          ),
          Image.asset(
            ImageConstants.login_background_ui_two,
            width: double.infinity,
            height: context.screenHeight * 0.344,

            fit: BoxFit.fill,
          ),

          Positioned(
            right: context.screenWidth * 0.05,
            top: context.screenHeight * 0.025,
            child: languageSelector(context: context),
          ),

          Positioned(
            top: context.screenHeight * 0.133,
            left: context.screenWidth * 0.07,
            child: Image.asset(
              ImageConstants.primaryLogo,
              width: context.screenWidth * 0.25,
              height: context.screenWidth * 0.25,
            ),
          ),

          // Positioned(
          //   bottom: 0,
          //   child: Container(
          //     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
          //     width: context.screenWidth,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         CustomText(
          //           text: "Prepared by Payme Fintech",
          //           fontSize: 12,
          //           fontWeight: AppFontWeight.light,
          //         ),
          //         CustomText(
          //           text: "version 1.1",
          //           fontSize: 12,
          //           fontWeight: AppFontWeight.light,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
