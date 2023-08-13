import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../repository/models/learning_path_step_response_model.dart';

class LearningPathCardWidget extends StatelessWidget {
  const LearningPathCardWidget({super.key, required this.learningPathName,required this.learningSteps, required this.onTap});

  final String learningPathName;
  final List<LearningPathStepResponseModel> learningSteps;
  final VoidCallback onTap;

  final List<Color> microsoftColors = const [
    Color(0xFFBA1A1A),
    Color(0xFF7FBA00),
    Color(0xFF00A4EF),
    Color(0xFFFFB900),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width * 0.5,
        padding: context.edgeLow,
        margin: context.edgeLow,
        decoration: BoxDecoration(
          borderRadius: context.radiusAll,
          color: context.learningPathColor.withOpacity(0.75),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(learningPathName, style: context.textTheme.displayLarge!.copyWith(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),),
                  Icon(Icons.navigate_next, color: Colors.white,)
                ],
              )

            ),
            Divider(color: Colors.white, height: context.height * 0.01,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var step in learningSteps)
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Checkbox(value: step.isCompleted, onChanged: (value){},),
                          Text(step.name ?? "unknown",
                            style: context.textTheme.displayLarge!.copyWith(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}