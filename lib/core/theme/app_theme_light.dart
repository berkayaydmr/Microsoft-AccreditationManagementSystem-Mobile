import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;

  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  final _lightBase = ThemeData.light(
    useMaterial3: true
  );

  @override
  ThemeData get theme => _lightBase.copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.light,
    appBarTheme: _lightBase.appBarTheme.copyWith(
      backgroundColor: AppColors.light,
      foregroundColor: AppColors.dark,
      iconTheme: const IconThemeData(color: AppColors.dark),
      elevation: 0,
    ),
    bottomNavigationBarTheme: _lightBase.bottomNavigationBarTheme.copyWith(
      backgroundColor: AppColors.light,
      selectedItemColor: AppColors.dark,
    ),
    snackBarTheme:
    _lightBase.snackBarTheme.copyWith(backgroundColor: AppColors.dark),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
          side: const BorderSide(color: AppColors.primaryDark)
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            backgroundColor: AppColors.primaryLight,
            textStyle: const TextStyle(color: AppColors.light),
            side: const BorderSide(color: AppColors.primaryDark),
            elevation: 0,
        )
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        )
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      elevation: 0
    ),
    brightness: Brightness.light, colorScheme: _lightBase.colorScheme.copyWith(primary: AppColors.primaryLight, secondary: AppColors.secondary, background: AppColors.light),
  );

  ColorScheme _colorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF00A4EF),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFCBE6FF),
      onPrimaryContainer: Color(0xFF001E30),
      secondary: Color(0xFFFFB900),
      onSecondary: Color(0xFFFAFAFA),
      secondaryContainer: Color(0xFFFFEB00),
      onSecondaryContainer: Color(0xB8FFB900),
      tertiary: Color(0xFF7FBA00),
      onTertiary: Color(0xFFFAFAFA),
      tertiaryContainer: Color(0xEFD1E3AD),
      onTertiaryContainer: Color(0xB27FBA00),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFAFAFA),
      onErrorContainer: Color(0xFF410002),
      background: Color(0xFFFAFAFA),
      onBackground: Color(0xFF1C1B1E),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1C1B1E),
      surfaceVariant: Color(0xFFEDEDED),
      onSurfaceVariant: Color(0xFF48454E),
      outline: Color(0xFF79757F),
      onInverseSurface: Color(0xFFF4EFF4),
      inverseSurface: Color(0xFF313033),
      inversePrimary: Color(0xFFCDBDFF),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF005E93),
      outlineVariant: Color(0xFFCAC4CF),
      scrim: Color(0xFF000000),
    );


    ColorScheme _yagmur() {
      return const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFFAD256A),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFFFD9E4),
        onPrimaryContainer: Color(0xFF3E0021),
        secondary: Color(0xFFA23275),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFFFD8E8),
        onSecondaryContainer: Color(0xFF3D0027),
        tertiary: Color(0xFF824791),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFFCD7FF),
        onTertiaryContainer: Color(0xFF340043),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFF8FDFF),
        onBackground: Color(0xFF001F25),
        surface: Color(0xFFF8FDFF),
        onSurface: Color(0xFF001F25),
        surfaceVariant: Color(0xFFF2DDE2),
        onSurfaceVariant: Color(0xFF514347),
        outline: Color(0xFF837377),
        onInverseSurface: Color(0xFFD6F6FF),
        inverseSurface: Color(0xFF00363F),
        inversePrimary: Color(0xFFFFB0CC),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFFAD256A),
      );
    }
  }
}