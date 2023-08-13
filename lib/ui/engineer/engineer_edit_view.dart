import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/repository/models/engineer_response_model.dart';
import 'package:accreditation_management_system/repository/models/put_engineer_request_model.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/image_constants.dart';
import '../../repository/engineer_repository.dart';
import 'bloc/engineer_bloc.dart';

@RoutePage()
class EngineerEditView extends StatefulWidget {
  const EngineerEditView({super.key, required this.engineerID});
  final int engineerID;

  @override
  _EngineerEditViewState createState() => _EngineerEditViewState();
}

class _EngineerEditViewState extends State<EngineerEditView> {
  late final _engineerBloc;

  late EngineerResponseModel engineer;

  @override
  void initState() {
    _engineerBloc = EngineerBloc(
        engineerRepository:
            RepositoryProvider.of<IEngineerRepository>(context));
    _engineerBloc.add(EngineerDetailFetch(id: widget.engineerID));

    super.initState();
  }

  final engineeerNameController = TextEditingController();
  final engineeerSurnameController = TextEditingController();

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
          child: BlocBuilder<EngineerBloc, EngineerState>(
            bloc: _engineerBloc,
            builder: (context, state) {
              if (state is EngineerDetailSuccess) {
                engineeerNameController.text = state.engineer.name!
                    .replaceAll(state.engineer.name!.split(" ").last, "");
                engineeerSurnameController.text =
                    state.engineer.name!.split(" ").last;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Name",
                          ),
                          controller: engineeerNameController,
                        ),
                        SizedBox(height: context.height * 0.02),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Surname",
                          ),
                          controller: engineeerSurnameController,
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _engineerBloc.add(EngineerEditButtonPressed(
                            engineer: PutEngineerRequestModel(
                          id: widget.engineerID,
                          name:
                              "${engineeerNameController.text} ${engineeerSurnameController.text}",
                        )));
                      },
                      child: const Text("Edit"),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ));
  }
}
