import 'package:flutter/material.dart';

extension ColorExtension on BuildContext{
  Color get mipColor => const Color(0xFFBA1A1A);
  Color get engineerColor => const Color(0xFF7FBA00);
  Color get learningPathColor => const Color(0xFF00A4EF);
  Color get accreditationColor => const Color(0xFFFFB900);
}

extension ContextExtension on BuildContext{
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get appBarHeight => height * 0.065;
  double get bottomAppBarHeight => height * 0.130;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get highValue => height * 0.04;
  double get ultraValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
  InputDecorationTheme get inputThemes => theme.inputDecorationTheme;
}

extension EdgeExtensionAll on BuildContext {
  EdgeInsets get edgeLow => EdgeInsets.all(lowValue);
  EdgeInsets get edgeNormal => EdgeInsets.all(normalValue);
  EdgeInsets get edgeHigh => EdgeInsets.all(highValue);
  EdgeInsets get edgeUltra => EdgeInsets.all(ultraValue);
}

extension EdgeExtensionOnly on BuildContext {
  EdgeInsets get edgeLowTop => EdgeInsets.only(top: lowValue);
  EdgeInsets get edgeNormalTop => EdgeInsets.only(top: normalValue);
  EdgeInsets get edgeHighTop => EdgeInsets.only(top: highValue);
  EdgeInsets get edgeUltraTop => EdgeInsets.only(top: ultraValue);

  EdgeInsets get edgeLowRight => EdgeInsets.only(right: lowValue);
  EdgeInsets get edgeNormalRight => EdgeInsets.only(right: normalValue);
  EdgeInsets get edgeHighRight => EdgeInsets.only(right: highValue);
  EdgeInsets get edgeUltraRight => EdgeInsets.only(right: ultraValue);

  EdgeInsets get edgeLowBottom => EdgeInsets.only(bottom: lowValue);
  EdgeInsets get edgeNormalBottom => EdgeInsets.only(bottom: normalValue);
  EdgeInsets get edgeHighBottom => EdgeInsets.only(bottom: highValue);
  EdgeInsets get edgeUltraBottom => EdgeInsets.only(bottom: ultraValue);

  EdgeInsets get edgeLowLeft => EdgeInsets.only(left: lowValue);
  EdgeInsets get edgeNormalLeft => EdgeInsets.only(left: normalValue);
  EdgeInsets get edgeHighLeft => EdgeInsets.only(left: highValue);
  EdgeInsets get edgeUltraLeft => EdgeInsets.only(left: ultraValue);
}

extension EdgeExtensionSymmetric on BuildContext {
  EdgeInsets get edgeLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get edgeNormalVertical => EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get edgeHighVertical => EdgeInsets.symmetric(vertical: highValue);
  EdgeInsets get edgeUltraVertical => EdgeInsets.symmetric(vertical: ultraValue);

  EdgeInsets get edgeLowHorizontal => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get edgeNormalHorizontal => EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get edgeHighHorizontal => EdgeInsets.symmetric(horizontal: highValue);
  EdgeInsets get edgeUltraHorizontal => EdgeInsets.symmetric(horizontal: ultraValue);
}

extension RadiusExtension on BuildContext {
  BorderRadius get radiusAll => const BorderRadius.all(Radius.circular(15));
  Radius get radiusValue => const Radius.circular(15);
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 300);
}

extension CurveExtension on BuildContext{
  Curve get easeInCurve => const FlippedCurve(Curves.easeIn);
}