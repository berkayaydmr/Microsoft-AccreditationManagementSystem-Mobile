import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'field_title_widget.dart';

class FieldAndValueWidget extends StatelessWidget {
  final String title;
  final String value;
  final Color headTitleColor;

  FieldAndValueWidget({required this.title, required this.value, required this.headTitleColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldTitleWidget(title: title, backgroundColor: headTitleColor),
        SizedBox(
          height: context.height * 0.01,
        ),
        Center(
            child: Text(
          value,
          style: context.textTheme.headlineMedium!.copyWith(color: Colors.grey, fontSize: 25),
        )),
      ],
    );
  }
}
