import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    _instance ??= AppThemeDark._init();
    return _instance!;
  }

  AppThemeDark._init();

  final _darkBase = ThemeData.dark(
    useMaterial3: true
  );

  @override
  ThemeData get theme => _darkBase.copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.dark,
    appBarTheme: _darkBase.appBarTheme.copyWith(
      backgroundColor: AppColors.dark,
      foregroundColor: AppColors.light,
      iconTheme: const IconThemeData(color: AppColors.light),
      elevation: 0,
    ),
    bottomNavigationBarTheme: _darkBase.bottomNavigationBarTheme.copyWith(
      backgroundColor: AppColors.dark,
      selectedItemColor: AppColors.light,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          side: const BorderSide(color: AppColors.primaryLight)
        )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            backgroundColor: AppColors.primaryDark,
            textStyle: const TextStyle(color: AppColors.dark),
            side: const BorderSide(color: AppColors.primaryLight),
          elevation: 0
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
        color: AppColors.darkGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        elevation: 0
    ),
    brightness: Brightness.dark, colorScheme: _darkBase.colorScheme.copyWith(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondary,
      background: AppColors.dark,
    onSurface: Colors.white
  ),
  );

  /*ColorScheme _colorScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFDCB8FF),
      onPrimary: Color(0xFF480081),
      primaryContainer: Color(0xFF6700B5),
      onPrimaryContainer: Color(0xFFF0DBFF),
      secondary: Color(0xFFDCB8FF),
      onSecondary: Color(0xFF480081),
      secondaryContainer: Color(0xFF6700B5),
      onSecondaryContainer: Color(0xFFF0DBFF),
      tertiary: Color(0xFFDCB8FF),
      onTertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFF6700B5),
      onTertiaryContainer: Color(0xFFF0DBFF),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFDAD6),
      background: Color(0xFF000000),
      onBackground: Color(0xFFFFFFFF),
      surface: Color(0xFF000000),
      onSurface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFF4A454E),
      onSurfaceVariant: Color(0xFFCCC4CE),
      outline: Color(0xFF968E98),
      onInverseSurface: Color(0xFF3E0021),
      inverseSurface: Color(0xFFFFD9E4),
      inversePrimary: Color(0xFF822DD2),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFFDCB8FF),
    );

  }
  */
}
