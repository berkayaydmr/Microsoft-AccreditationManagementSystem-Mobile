import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search_off_outlined,
          color: context.colors.primary.withOpacity(0.7),
          size: 150,
        ),
        SizedBox(
          height: context.normalValue,
        ),
        const Text(
          "Henüz Bir Şey Yok",
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: context.ultraValue,
        ),
      ],
    );
  }
}
