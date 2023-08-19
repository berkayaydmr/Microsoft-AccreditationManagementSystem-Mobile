import 'package:accreditation_management_system/core/constants/microsoft_colors.dart';
import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/base/functions/base_functions.dart';
import '../../core/navigation/navigation.dart';
import '../shared/widget/list_card.dart';

@RoutePage()
class AccreditationView extends StatefulWidget {
  const AccreditationView({super.key});

  @override
  State<AccreditationView> createState() => _AccreditationViewState();
}

class _AccreditationViewState extends State<AccreditationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Accreditations",
            style: TextStyle(color: MicrosoftColor.YELLOW)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListCard(
                      text: 'Accreditation $index',
                      cardColor: context.accreditationColor,
                      onTap: () {
                        context.router
                            .push(const AccreditationDetailViewRoute());
                      });
                }),
          )
        ],
      ),
    );
  }
}
