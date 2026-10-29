import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageService {
  static const int _maxSizeInBytes = 1024 * 1024; // 1MB

  ///Public method (use this)
  static Future<File> processImage(File file) async {
    final size = await file.length();

    debugPrint("Temp Log => $size");

    // If <= 1MB → return original
    if (size <= _maxSizeInBytes) {
      return file;
    }

    // If > 1MB → compress until under 1MB
    return await _compressUntilUnderLimit(file);
  }

  /// Compress loop (guarantee under 1MB)
  static Future<File> _compressUntilUnderLimit(File file) async {
    File resultFile = file;
    int quality = 90;

    while ((await resultFile.length()) > _maxSizeInBytes && quality > 10) {
      final targetPath = _generateTempPath(resultFile.path);

      final compressed = await FlutterImageCompress.compressAndGetFile(
        resultFile.absolute.path,
        targetPath,
        quality: quality,
        minWidth: 1024,
        minHeight: 1024,
      );

      if (compressed == null) break;

      resultFile = File(compressed.path);
      quality -= 10;
    }

    return resultFile;
  }

  /// Safe file path generator (avoid .jpg issue)
  static String _generateTempPath(String originalPath) {
    return "${originalPath}_compressed.jpg";
  }
}
