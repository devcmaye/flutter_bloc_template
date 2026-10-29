import 'package:flutter/material.dart';
import '../app_config/app_color.dart';
import '../constants/image_constants.dart';

class ScanFloatingButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ScanFloatingButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.deepPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(color: Colors.white, width: 2),
      ),
      onPressed: onPressed,
      child: Image.asset(ImageConstants.scan_icon, width: 24, height: 24),
    );
  }
}
