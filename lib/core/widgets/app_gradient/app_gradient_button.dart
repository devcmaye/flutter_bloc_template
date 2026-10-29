import 'package:flutter/material.dart';

import '../../app_config/app_color.dart';

class AppGradientButton extends StatelessWidget {
  final Widget child;

  const AppGradientButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [AppColor.deepPrimaryColor, AppColor.primaryColor],
          stops: [0.0, 1.0],
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
