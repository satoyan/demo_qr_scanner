import 'package:flutter/material.dart';

// Spacing Constants
class AppSpacing {
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

// Padding Constants
class AppPadding {
  static const EdgeInsets allS = EdgeInsets.all(AppSpacing.s);
  static const EdgeInsets allM = EdgeInsets.all(AppSpacing.m);
  static const EdgeInsets horizontalS = EdgeInsets.symmetric(horizontal: AppSpacing.s);
  static const EdgeInsets verticalS = EdgeInsets.symmetric(vertical: AppSpacing.s);
}

// Radius Constants
class AppRadius {
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
}

// Font Size Constants
class AppFontSizes {
  static const double bodySmall = 12.0;
  static const double bodyMedium = 14.0;
  static const double bodyLarge = 16.0;
  static const double headlineSmall = 24.0;
  static const double headlineMedium = 28.0;
  static const double headlineLarge = 32.0;
}
