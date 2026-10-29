// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnvironmentBanner extends StatelessWidget {
  final bool isUAT;
  final Color color;
  final Widget child;

  const EnvironmentBanner({
    super.key,
    required this.isUAT,
    required this.child,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    if (!isUAT) return child;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Banner(
        message: "UAT",
        location: BannerLocation.topEnd,
        color: color,
        child: child,
      ),
    );
  }
}
