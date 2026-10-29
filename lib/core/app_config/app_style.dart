import 'package:flutter/material.dart';

import '../constants/image_constants.dart';

class AppStyle {
  static Container logo(double height) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.bottomLeft,
      height: height,
      child: Center(
        child: Image(
          height: height,
          image: AssetImage(ImageConstants.primaryLogo),
        ),
      ),
    );
  }
}
