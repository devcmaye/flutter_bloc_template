import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/image_constants.dart';

extension ToastExtension on String {
  void showToast(BuildContext context, {bool status = true}) {
    FToast fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      margin: const EdgeInsets.symmetric(vertical: 45),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(ImageConstants.payme_pinsin, width: 24, height: 24),
          const SizedBox(width: 12.0),
          // Your Message
          Flexible(
            child: Text(
              this,
              style: TextStyle(
                color: status ? Colors.green : Colors.red,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(milliseconds: 1500),
    );
  }
}
