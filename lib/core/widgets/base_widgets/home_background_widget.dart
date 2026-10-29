import 'package:flutter/material.dart';
import '../../../../core/constants/image_constants.dart';
import '../../../../core/extensions/media_query_extension.dart';
import '../../app_config/app_color.dart';

class HomeBackgroundWidget extends StatelessWidget {
  const HomeBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: Stack(
        children: [
          Image.asset(
            ImageConstants.app_bar_ui_one,
            width: double.infinity,
            height: context.screenHeight * 0.35,
            fit: BoxFit.fill,
          ),
          Image.asset(
            ImageConstants.app_bar_ui_two,
            width: double.infinity,
            height: context.screenHeight * 0.33,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
