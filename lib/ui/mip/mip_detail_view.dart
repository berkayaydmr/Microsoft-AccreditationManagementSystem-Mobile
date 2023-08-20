import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/repository/mip_repository.dart';
import 'package:accreditation_management_system/repository/models/mip.dart';
import 'package:accreditation_management_system/ui/mip/bloc/mip_bloc.dart';
import 'package:accreditation_management_system/ui/shared/widget/field_and_value_widget.dart';
import 'package:accreditation_management_system/ui/shared/widget/learning_path_card_widget.dart';
import 'package:accreditation_management_system/ui/shared/widget/property_card.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/image_constants.dart';
import '../../repository/models/learning_path_step_response_model.dart';
import '../shared/widget/field_title_widget.dart';

@RoutePage()
class MipDetailView extends StatefulWidget {
  const MipDetailView({super.key});

  @override
  State<MipDetailView> createState() => _MipDetailViewState();
}

class _MipDetailViewState extends State<MipDetailView> {
  late MipBloc _mipBloc;

  @override
  void initState() {
    _mipBloc = MipBloc(mipRepository: RepositoryProvider.of<IMipRepository>(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImageConstants.instance.logo,
          height: context.height * 0.05,
          cacheHeight: 100,
        ),
        actions: [
          BlocBuilder<MipBloc, MipState>(
            bloc: _mipBloc,
            builder: (context, state) {
              return IconButton(onPressed: () {}, splashRadius: 20, icon: const Icon(Icons.verified_outlined));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: context.edgeLow,
              child: FieldAndValueWidget(title: "Name", value: "Mip Name", headTitleColor: context.mipColor),
            ),
            PropertyCard(title: 'Engineers', count: '10', cardColor: context.engineerColor, onTap: () {}),
            Container(
              height: context.height * 0.35,
              width: context.width,
              padding: context.edgeLow,
              child: buildWithFieldTitle(context, "Learning Paths"),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildWithFieldTitle(BuildContext context, String headTitle) {
  List<LearningPathStepResponseModel> learningPaths = [
    LearningPathStepResponseModel(id: 1, name: "Learning Step 1", isCompleted: true),
    LearningPathStepResponseModel(id: 2, name: "Learning Step 2", isCompleted: false),
    LearningPathStepResponseModel(id: 3, name: "Learning Step 3", isCompleted: false),
  ];

  return Column(
    children: [
      Expanded(
          flex: 1,
          child: FieldTitleWidget(
            title: headTitle,
            backgroundColor: context.learningPathColor,
          )),
      Expanded(
        flex: 4,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return LearningPathCardWidget(learningPathName: "Learning Path $index", learningSteps: learningPaths, onTap: () {});
            }),
      ),
    ],
  );
}

Widget buildWithPropertyCard(BuildContext context) {
  return Column(
    children: [
      PropertyCard(title: 'Engineer', count: '10', cardColor: context.engineerColor, onTap: () {}),
    ],
  );
}
