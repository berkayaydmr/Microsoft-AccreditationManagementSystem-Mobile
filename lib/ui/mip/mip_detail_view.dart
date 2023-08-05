import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/ui/shared/widget/head_title_widget.dart';
import 'package:accreditation_management_system/ui/shared/widget/property_card.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../core/base/functions/base_functions.dart';
import '../../core/constants/image_constants.dart';
import '../shared/widget/field_title_widget.dart';

@RoutePage()
class MipDetailView extends StatelessWidget {
  const MipDetailView({super.key});

  @override
  Widget build(BuildContext context) {
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
          HeadTitleWidget(titles: ["MIPs","MIP 1"],hideButtons: true,),
          Container(
              padding: context.edgeLow,
              child: buildWithFieldTitle(context)),
        ],
      ),
    );
  }
}

Widget buildWithFieldTitle(BuildContext context) {
  return Column(
    children: [
      FieldTitleWidget(title: "LearningPath", backgroundColor: context.learningPathColor,),
      SizedBox(
        height: context.height * 0.1,
        width: context.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context,index){
            return Padding(
              padding: context.edgeLow,
              child: FilterChip(label: Text("LearningPath $index"), onSelected: (value){}),
            );
          }
        ),
      )
    ],
  );
}

Widget buildWithPropertyCard(BuildContext context) {
  return Column(
    children: [
      PropertyCard(title: 'Engineer', count: '10', cardColor: context.engineerColor, onTap: (){}),
      PropertyCard(title: 'Learning Path', count: '5', cardColor: context.learningPathColor, onTap: (){})
    ],
  );
}