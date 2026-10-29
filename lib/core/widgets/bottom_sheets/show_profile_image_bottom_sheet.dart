import 'dart:convert';
import 'package:flutter/material.dart';
import '../../constants/image_constants.dart';

class ShowProfileImageBottomSheet extends StatelessWidget {
  final String? base64;

  const ShowProfileImageBottomSheet({super.key, required this.base64});

  @override
  Widget build(BuildContext context) {
    final ImageProvider imageProvider = base64 != null
        ? MemoryImage(base64Decode(base64!))
        : const AssetImage(ImageConstants.default_image_profile);

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      color: Colors.black.withValues(alpha: 0.8),

      child: SafeArea(
        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                minScale: 1.0,
                maxScale: 3.0,
                child: Image(
                  image: imageProvider,
                  fit: BoxFit.scaleDown,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
