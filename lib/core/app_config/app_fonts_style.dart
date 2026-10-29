import 'dart:ui';

import 'package:flutter/material.dart';

class AppFontsSize {
  static const double large = 26;
  static const double x_large = 28;
  static const double xx_large = 30;
  static const double xxx_large = 32;

  // Headings
  static const double h1 = 24; // Page title / Main header
  static const double h2 = 20; // Section header
  static const double h3 = 18; // Sub section header
  static const double h4 = 16; // Sub section header
  static const double h5 = 14; // Sub section header
  static const double h6 = 12; // Sub section header

  static const double appbar_title = 16; // Buttons
  static const double appbar_sub_title = 15; // Buttons
  static const double appbar_body = 13; // TextField input

  // Body text
  static const double bodyExtraLarge = 18; // Primary content
  static const double bodyLarge = 16; // Primary content
  static const double bodyNormal = 14; // Default body text
  static const double body = 13; // Default body text
  static const double bodySmall = 12; // Secondary text
  static const double bodyExtraSmall = 11; // Secondary text

  // Lists
  static const double listTitle = 14; // List item title
  static const double listSubtitle = 12; // List item subtitle

  // UI / Controls
  static const double button = 14; // Buttons
  static const double input = 14; // TextField input
  static const double label = 12; // Field labels

  // Helper / Meta
  static const double caption = 11; // Hints, footers
  static const double overline = 10; // Very small text (timestamps, tags)
}

class AppFontWeight {
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
}

class AppFontFamily {
  // Primary (English / Myanmar)
  static const String googleSansFlex = 'Google_Sans_Flex';
  static const String poppins = 'Poppins';
  static const String notoSansMyanmar = 'NotoSansMyanmar';
  static const String defaultFont = googleSansFlex;
}
