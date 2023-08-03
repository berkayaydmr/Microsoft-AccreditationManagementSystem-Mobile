import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/ui/shared/widget/head_title_widget.dart';
import 'package:accreditation_management_system/ui/shared/widget/property_card.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../core/base/functions/base_functions.dart';

@RoutePage()
class MipDetailView extends StatelessWidget {
  const MipDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("MIPs > .Net"),
        flexibleSpace: appBarLinearGradient(),
      ),
      body: Column(
        children: [
          PropertyCard(title: 'Engineer', count: '10', cardColor: context.engineerColor, onTap: (){}),
          PropertyCard(title: 'Learning Path', count: '5', cardColor: context.learningPathColor, onTap: (){})
        ],
      ),
    );
  }
}
