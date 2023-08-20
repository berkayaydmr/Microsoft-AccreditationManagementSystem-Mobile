// ignore_for_file: prefer_const_constructors

import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/ui/shared/widget/field_and_value_widget.dart';
import 'package:accreditation_management_system/ui/shared/widget/head_title_widget.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/constants/image_constants.dart';
import '../../core/navigation/navigation.dart';
import '../../repository/models/learning_path_step_response_model.dart';

@RoutePage()
class LearningPathDetailView extends StatelessWidget {
  const LearningPathDetailView({super.key});
  final isEditing = false;

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
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                context.router.push(LearningPathEditViewRoute(learningPathID: 1));
              },
              icon: Icon(Icons.edit)),
        ],
      ),
      body: Container(
        padding: context.edgeNormal,
        child: Column(
          children: [
            Expanded(child: FieldAndValueWidget(title: "Name", value: "Learning Path Name", headTitleColor: context.learningPathColor)),
            Expanded(
              flex: 4,
              child: learningStepsList(),
            )
          ],
        ),
      ),
    );
  }
}

Widget learningStepsList() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return Row(children: [Checkbox(value: false, onChanged: (value) {}), Text("Learning Step $index")]);
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100), side: BorderSide(color: Colors.grey)),
    ),
  );
}
