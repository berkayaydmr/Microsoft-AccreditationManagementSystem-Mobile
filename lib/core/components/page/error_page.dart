import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, this.tryAgainFunction}) : super(key: key);

  final Function()? tryAgainFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Bir Hata Meydana Geldi!",
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: context.lowValue,
        ),
        Visibility(
          visible: tryAgainFunction != null,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              fixedSize: Size.fromWidth(context.width * 0.6),
              padding: context.edgeLow
            ),
              onPressed: tryAgainFunction,
              child: Text('Tekrar Deneyin', style: context.textTheme.titleMedium!.copyWith(color: context.colors.onSurface),)),
        ),
        SizedBox(
          height: context.ultraValue,
        ),
      ],
    );
  }
}
