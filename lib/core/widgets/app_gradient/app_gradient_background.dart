import 'package:flutter/material.dart';

import '../../app_config/app_color.dart';

class AppGradientBackground extends StatelessWidget {
  final Widget child;

  const AppGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColor.deepPrimaryColor,
            AppColor.primaryColor,
            AppColor.secondaryColor,
            AppColor.whiteColor,
            AppColor.whiteColor,
          ],
          stops: [0.0, 0.3, 0.5, 0.7, 1.0],
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
