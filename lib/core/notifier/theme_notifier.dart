import 'package:flutter/material.dart';

import '../theme/app_theme_dark.dart';
import '../theme/app_theme_light.dart';
class ThemeNotifier extends ChangeNotifier with WidgetsBindingObserver {
  late ThemeData _currentTheme;

  ThemeNotifier() {
    _currentTheme = _getInitialTheme();
    //WidgetsBinding.instance.addObserver(this);
  }

  ThemeData get currentTheme => _currentTheme;

  ThemeData _getInitialTheme() {
    return AppThemeLight.instance.theme;
    final Brightness platformBrightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return platformBrightness == Brightness.dark ? AppThemeDark.instance.theme : AppThemeLight.instance.theme;
  }

  void _updateTheme(ThemeData newTheme) {
    if (_currentTheme != newTheme) {
      _currentTheme = newTheme;
      notifyListeners();
    }
  }

  /*@override
  void didChangePlatformBrightness() {
    final Brightness brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final ThemeData newTheme = brightness == Brightness.dark ? AppThemeDark.instance.theme : AppThemeLight.instance.theme;
    _updateTheme(newTheme);
  }*/

  void switchTheme() {
    final ThemeData newTheme = _currentTheme.brightness == Brightness.light ? AppThemeDark.instance.theme : AppThemeLight.instance.theme;
    _updateTheme(newTheme);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
