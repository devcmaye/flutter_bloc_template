import 'dart:convert';

import 'package:flutter/material.dart';

class Base64Image extends StatelessWidget {
  final String base64String;

  const Base64Image({super.key, required this.base64String});

  @override
  Widget build(BuildContext context) {
    return Image.memory(      
      base64Decode(base64String),
      width: 200,
      height: 200,
      fit: BoxFit.cover,
    );
  }
}
