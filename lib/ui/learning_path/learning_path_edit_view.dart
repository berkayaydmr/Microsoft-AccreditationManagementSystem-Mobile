import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/repository/models/learning_path_response_model.dart';
import 'package:accreditation_management_system/repository/models/learning_path_step_response_model.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/image_constants.dart';

@RoutePage()
class LearningPathEditView extends StatefulWidget {
  final int learningPathID;
  const LearningPathEditView({super.key, required this.learningPathID});

  @override
  State<LearningPathEditView> createState() => _LearningPathEditViewState();
}

class _LearningPathEditViewState extends State<LearningPathEditView> {
  TextEditingController _learningPathNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          ImageConstants.instance.logo,
          height: context.height * 0.05,
          cacheHeight: 100,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.done_all)),
        ],
      ),
      body: Container(
        padding: context.edgeNormal,
        child: Column(
          children: [
            Expanded(
                child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Learning Path Name',
              ),
              controller: _learningPathNameController,
            )),
            Expanded(
              flex: 4,
              child: learningStepsList(),
            )
          ],
        ),
      ),
    );
  }

  Widget learningStepsList() {
    List<LearningPathStepResponseModel> learningPathSteps = LearningPathResponseModel.sampleLearningPathStepList;
    return ListView.builder(
      itemCount: learningPathSteps.length,
      itemBuilder: (context, index) {
        return Row(children: [
          Checkbox(
              value: learningPathSteps[index].isCompleted,
              onChanged: (value) {
                setState(() {
                  learningPathSteps[index].isCompleted = value;
                });
              }),
          Text(learningPathSteps[index].name ?? "unknown")
        ]);
      },
    );
  }
}
