import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class LearningPathComponent extends StatelessWidget {
  const LearningPathComponent({super.key, required this.learningSteps});

  final List<LearningStep> learningSteps;

  static SAMPLE(){
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LearningStep(isCompleted: true,isLast: false),
        LearningStep(isCompleted: true,isLast: false),
        LearningStep(isCompleted: true,isLast: false),
        LearningStep(isCompleted: false,isLast: false),
        LearningStep(isCompleted: false,isLast: true),
      ]
    );
  }

  static COMPLETED_SAMPLE(){
    return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LearningStep(isCompleted: true,isLast: false),
          LearningStep(isCompleted: true,isLast: false),
          LearningStep(isCompleted: true,isLast: false),
          LearningStep(isCompleted: true,isLast: false),
          LearningStep(isCompleted: true,isLast: true),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListView.builder(
            itemCount: learningSteps.length,
            itemBuilder: (context,index){
              return LearningStep(isCompleted: learningSteps[index].isCompleted!, isLast: (learningSteps.length-1)==index);
            },
           )
        ]);
  }
}

class LearningStep extends StatelessWidget {
  final bool isCompleted;
  final bool isLast;
  const LearningStep({Key? key, required this.isCompleted, required this.isLast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: !isLast ? context.width * 0.15 : 20,
      child: Stack(
        children: [
          if(!isLast)
            const Positioned(
              child: Divider(
                height: 20,
                color: Colors.black,
                thickness: 2,
              ),
            ),
          Positioned(
            child: SizedBox(
              width: 20,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCompleted ? Colors.green : Colors.grey,
                    ),
                    child: const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Icon(
                    Icons.check,
                    color: isCompleted ? Colors.green : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
