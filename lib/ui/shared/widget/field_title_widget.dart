
import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FieldTitleWidget extends StatelessWidget {
  const FieldTitleWidget({super.key, required this.title, required this.backgroundColor});
  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: context.edgeNormal,
      decoration: BoxDecoration(
        borderRadius: context.radiusAll,
        color: backgroundColor,
      ),
      child: Center(child: Text(title, style: context.textTheme.titleMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),)),
    );
  }
}