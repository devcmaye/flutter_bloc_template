import 'package:flutter/material.dart';

class DismissedKeyboardWidget extends StatelessWidget {
  final Widget child;

  const DismissedKeyboardWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
