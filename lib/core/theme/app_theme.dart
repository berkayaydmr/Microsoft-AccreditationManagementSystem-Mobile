import 'package:flutter/material.dart';

abstract class AppColors {
  /// Dark color.
  static const dark = Colors.black;

  static const light = Color(0xFFFAFAFA);

  /// Grey background accent.
  static const grey = Color(0xFF262626);

  /// Primary text color
  static const primaryText = Colors.white;

  ///Primary Light color
  static const primaryLight = Color(0xFF6930EE);

  ///Primary Dark color
  static const primaryDark =  Color(0xFFDCB8FF);

  /// Secondary color.
  static const secondary = Color(0xFF6930EE);

  /// Color to use for favorite icons (indicating a like).
  static const like = Color(0xFFBA1A1A);

  /// Grey faded color.
  static const faded = Colors.grey;

  /// Background color
  static const background = Color(0xFFFAFAFA);

  /// Dark grey color
  static const darkGrey = Color(0xFF111111);

  /// Top gradient color used in various UI components.
  static const topGradient = Color(0xFFE60064);

  /// Bottom gradient color used in various UI components.
  static const bottomGradient = Color(0xFFFFB344);
}

/// Global reference to application [TextStyle]s.
abstract class AppTextStyle {
  /// A medium bold text style.
  static const textStyleBoldMedium = TextStyle(
    fontWeight: FontWeight.w600,
  );

  /// A bold text style.
  static const textStyleBold = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const textStyleSmallBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );

  /// A faded text style. Uses [AppColors.faded].
  static const textStyleFaded =
  TextStyle(color: AppColors.faded, fontWeight: FontWeight.w400);

  /// A faded text style. Uses [AppColors.faded].
  static const textStyleFadedSmall = TextStyle(
      color: AppColors.faded, fontWeight: FontWeight.w400, fontSize: 11);

  /// A faded text style. Uses [AppColors.faded].
  static const textStyleFadedSmallBold = TextStyle(
      color: AppColors.faded, fontWeight: FontWeight.w500, fontSize: 11);

  /// Light text style.
  static const textStyleLight = TextStyle(fontWeight: FontWeight.w300);

  /// Action text
  static const textStyleAction = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.secondary,
  );
}

abstract class AppTheme {
  ThemeData? theme;
}