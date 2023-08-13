// ignore_for_file: prefer_const_constructors

import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/ui/shared/widget/head_title_widget.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../core/constants/image_constants.dart';
import '../../repository/models/learning_path_step_response_model.dart';

@RoutePage()
class LearningPathDetailView extends StatelessWidget {
  const LearningPathDetailView({super.key});
  final isEditing = false;

  @override
  Widget build(BuildContext context) {
    List<LearningPathStepResponseModel> learningPaths = [
      LearningPathStepResponseModel(
          id: 1, name: "Learning Step 1", isCompleted: true),
      LearningPathStepResponseModel(
          id: 2, name: "Learning Step 2", isCompleted: false),
      LearningPathStepResponseModel(
          id: 3, name: "Learning Step 3", isCompleted: false),
      LearningPathStepResponseModel(
          id: 2, name: "Learning Step 2", isCompleted: false),
      LearningPathStepResponseModel(
          id: 3, name: "Learning Step 3", isCompleted: false),
      LearningPathStepResponseModel(
          id: 2, name: "Learning Step 2", isCompleted: false),
      LearningPathStepResponseModel(
          id: 3, name: "Learning Step 3", isCompleted: false),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImageConstants.instance.logo,
          height: context.height * 0.05,
          cacheHeight: 100,
        ),
      ),
      body: Column(
        children: [
          const Expanded(
              flex: 1,
              child: HeadTitleWidget(
                titles: ["Learning Paths", "Learning Path 1"],
                hideButtons: true,
              )),
          SizedBox(
            height: context.height * 0.01,
          ),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  menuButton("Add Step", Icons.add, () {}),
                  menuButton("Edit", Icons.edit, () {}),
                  menuButton("Delete", Icons.delete, () {}),
                ],
              )),
          Expanded(
            flex: 10,
            child: learningStepsList(),
          )
        ],
      ),
    );
  }
}

Widget learningStepsList() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return Row(children: [
        Checkbox(value: false, onChanged: (value) {}),
        Text("Learning Step $index")
      ]);
    },
  );
}

Widget menuButton(String text, IconData icon, VoidCallback onPressed) {
  return TextButton.icon(
    onPressed: onPressed,
    label: Text(text),
    icon: Icon(
      icon,
    ),
    style: TextButton.styleFrom(
      fixedSize: Size(100, 50),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: Colors.grey)),
    ),
  );
}
