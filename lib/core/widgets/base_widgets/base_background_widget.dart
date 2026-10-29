import 'package:flutter/material.dart';

import '../../../../core/constants/image_constants.dart';
import '../../../../core/extensions/media_query_extension.dart';

class BaseBackgroundWidget extends StatelessWidget {
  const BaseBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight,
      child: Stack(
        children: [
          Image.asset(
            ImageConstants.app_bar_ui_one,
            width: double.infinity,
            height: context.screenHeight * 0.32,
            fit: BoxFit.fill,
          ),
          Image.asset(
            ImageConstants.app_bar_ui_two,
            width: double.infinity,
            height: context.screenHeight * 0.3,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
