import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ModalBottomSheetButton extends StatelessWidget {
  const ModalBottomSheetButton({Key? key, required this.title, required this.onPressed, required this.icon}) : super(key: key);

  final String title;
  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            fixedSize: Size
                .fromWidth(
                context
                    .width)),
        onPressed: (){
          onPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: context.normalValue * 1.3, color: context.colors.onSurface,),
            SizedBox(width: context.lowValue,),
            Text(
              title, style: context.textTheme.titleSmall!.copyWith(fontSize: context.normalValue,),),
          ],
        )
    );
  }
}
