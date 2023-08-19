import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/repository/models/learning_path_step_response_model.dart';
import 'package:accreditation_management_system/repository/models/post_mip_request_model.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/constants/image_constants.dart';
import '../../repository/models/post_learning_path_request_model.dart';
import '../../repository/models/post_learning_path_step_request_model.dart';

@RoutePage()
class MipAddView extends StatefulWidget {
  const MipAddView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MipAddViewState();
}

class _MipAddViewState extends State<StatefulWidget> {
  TextEditingController mipNameController = TextEditingController();
  TextEditingController learningPathController = TextEditingController();
  TextEditingController learningStepController = TextEditingController();

  List<PostLearningPathRequestModel> learningPaths = [];

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
      body: Container(
        padding: context.edgeNormal,
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: "MIP Name",
              ),
              controller: mipNameController,
            ),
            SizedBox(height: context.height * 0.05),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Learning Paths",
                      style:
                          context.textTheme.bodyLarge!.copyWith(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: _addLearningPath,
                      icon: Icon(Icons.add),
                    )
                  ],
                ),
                Divider(
                  height: context.height * 0.005,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              height: context.height * 0.5,
              width: context.width,
              child: ListView(
                children: learningPaths
                        .map((e) => _learningPathWidget(
                            e.name ?? "Unknown Path", e.learningSteps, () {}))
                        .toList() ??
                    [],
              ),
            ),
            ElevatedButton(onPressed: _createMip, child: Text("Create MIP"))
          ],
        ),
      ),
    );
  }

  void _createMip() {
    PostMIPRequestModel mip = PostMIPRequestModel(
        name: mipNameController.text, learningPaths: learningPaths);
  }

  List<PostLearningPathStepRequestModel> learningSteps = [];

  void _addLearningPath() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: context.height * 0.35,
              width: context.width,
              padding: context.edgeNormal,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Learning Path Name",
                      ),
                      controller: learningPathController,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: "Learning Path Step",
                                ),
                                controller: learningStepController,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  learningSteps.add(
                                      PostLearningPathStepRequestModel(
                                          name: learningStepController.text));
                                  learningStepController.clear();
                                });
                              },
                              icon: const Icon(Icons.add),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: context.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: learningSteps
                              .map((e) =>
                                  _customFilterChip(e.name ?? "Unknown", () {
                                    learningSteps.remove(e);
                                  }))
                              .toList(),
                        ),
                      )),
                  SizedBox(height: context.height * 0.01),
                  ElevatedButton(
                    onPressed: () {
                      learningPaths.add(PostLearningPathRequestModel(
                          name: learningPathController.text,
                          learningSteps: learningSteps));
                      learningPathController.clear();
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: const Text("Add Learning Path"),
                  )
                ],
              ),
            ));
  }

  Widget _learningPathWidget(String pathName,
      List<PostLearningPathStepRequestModel>? steps, VoidCallback onDelete) {
    return ListTile(
      title: Text(pathName,
          style: context.textTheme.bodyLarge!.copyWith(fontSize: 18)),
      trailing: IconButton(
        splashRadius: 20,
        onPressed: onDelete,
        icon: const Icon(Icons.delete),
      ),
      subtitle: SizedBox(
        height: context.height * 0.05,
        width: context.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: steps!
              .map((e) => _customFilterChip(e.name ?? "Unknown", null))
              .toList(),
        ),
      ),
    );
  }

  Widget _customFilterChip(String label, VoidCallback? deleteAction) {
    return Container(
      margin: context.edgeLow,
      padding: context.edgeNormalHorizontal,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(label),
          if (deleteAction != null)
            Padding(
              padding: context.edgeLow,
              child: InkWell(
                  onTap: deleteAction,
                  child: const Icon(
                    Icons.delete,
                    size: 20,
                  )),
            )
        ],
      ),
    );
  }
}
