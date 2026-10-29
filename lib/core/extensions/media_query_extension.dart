import 'package:flutter/material.dart';

extension MediaQueryX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // Insets
  double get viewInsetsBottom => mediaQuery.viewInsets.bottom;
  double get viewInsetsTop => mediaQuery.viewInsets.top;

  // Screen size
  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;

  // Padding
  EdgeInsets get padding => mediaQuery.padding;
}
