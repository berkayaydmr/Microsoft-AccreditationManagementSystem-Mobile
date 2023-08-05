import 'package:accreditation_management_system/core/constants/microsoft_colors.dart';
import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../core/base/functions/base_functions.dart';
import '../shared/widget/list_card.dart';

@RoutePage()
class LearningPathView extends StatefulWidget {
  const LearningPathView({super.key});

  @override
  State<LearningPathView> createState() => _LearningPathViewState();
}

class _LearningPathViewState extends State<LearningPathView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Learning Paths", style: TextStyle(color: MicrosoftColor.BLUE)),
      ),
      body: Column(
        children: [
          Expanded(
            child:ListView.builder(
                itemCount: 20,
                itemBuilder: (context,index){
                  return ListCard(text: 'Learning Path $index', cardColor: context.learningPathColor, onTap: (){
                  });
                }
            ),
          )
        ],
      ),
    );
  }
}
