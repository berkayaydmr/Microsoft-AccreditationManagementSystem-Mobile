import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../core/base/functions/base_functions.dart';
import '../shared/widget/list_card.dart';

@RoutePage()
class EngineerView extends StatefulWidget {
  const EngineerView({super.key});

  @override
  State<EngineerView> createState() => _EngineerViewState();
}

class _EngineerViewState extends State<EngineerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Engineers"),
        flexibleSpace: appBarLinearGradient(),
      ),
      body: Column(
        children: [
          Expanded(
            child:ListView.builder(
                itemCount: 20,
                itemBuilder: (context,index){
                  return ListCard(text: 'Engineer $index', cardColor: context.engineerColor, onTap: (){
                  });
                }
            ),
          )
        ],
      ),
    );
  }
}
