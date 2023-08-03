import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ProgressBarComponent extends StatelessWidget {
  const ProgressBarComponent({super.key, this.barBackgroundColor, this.barColor, this.value});

  final Color? barBackgroundColor;
  final Color? barColor;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: context.height * 0.01,
      color: barColor ?? Colors.green,
      backgroundColor: barBackgroundColor ?? Colors.grey,
      value: value ?? 0,
    );
  }
}