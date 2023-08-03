import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../button/modal_bottom_sheet_button.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({Key? key, required this.buttons}) : super(key: key);

  final List<ModalBottomSheetButton> buttons;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: context.highValue, vertical: context.lowValue),
        child: Column(
          mainAxisSize:
          MainAxisSize.min,
          crossAxisAlignment:
          CrossAxisAlignment
              .start,
          children: <Widget>[
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .center,
              children: [
                Container(
                  height: 5,
                  width: context.width *0.1,
                  decoration: BoxDecoration(
                    borderRadius: context.radiusAll,
                    color: context.colors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.normalValue,),
            for (int i = 0;
            i < buttons.length;
            i++) ...[
              buttons[i],
              Visibility(
                  visible: i != buttons.length - 1,
                  replacement: SizedBox(),
                  child: Divider()
              )
            ],
            SizedBox(
              height: context
                  .lowValue,
            ),
          ],
        ),
      ),
    );
  }
}
