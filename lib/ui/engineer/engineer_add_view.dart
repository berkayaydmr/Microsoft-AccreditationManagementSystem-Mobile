import 'package:accreditation_management_system/core/constants/image_constants.dart';
import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/repository/models/post_user_request_model.dart';
import 'package:auto_route/annotations.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/user_repository.dart';
import 'bloc/engineer_bloc.dart';

@RoutePage()
class EngineerAddView extends StatefulWidget {
  const EngineerAddView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EngineerAddViewState();
}

class _EngineerAddViewState extends State<EngineerAddView> {
  late final EngineerBloc _engineerBloc;
  TextEditingController engineerUsernameController = TextEditingController();
  TextEditingController engineerMailController = TextEditingController();
  TextEditingController engineerNameController = TextEditingController();
  TextEditingController engineerSurnameController = TextEditingController();
  TextEditingController engineerPasswordController = TextEditingController();

  @override
  void initState() {
    _engineerBloc = EngineerBloc(engineerRepository: RepositoryProvider.of<IUserRepository>(context));

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
        ),
        body: Container(
          padding: context.edgeNormal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Mail",
                    ),
                    controller: engineerMailController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Username",
                    ),
                    controller: engineerUsernameController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                    controller: engineerPasswordController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Name",
                    ),
                    controller: engineerNameController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Surname",
                    ),
                    controller: engineerSurnameController,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _createEngineer,
                child: const Text("Add Engineer"),
              ),
            ],
          ),
        ));
  }

  void _createEngineer() {
    _engineerBloc.add(EngineerAddButtonPressed(
        engineer: PostUserRequestModel(
            email: engineerMailController.text,
            username: engineerUsernameController.text,
            password: engineerPasswordController.text,
            firstName: engineerNameController.text,
            lastname: engineerSurnameController.text,
            userRole: 1)));

    _engineerBloc.stream.listen((event) {
      if (event is EngineerAddSuccess) {
        BotToast.showText(text: "Engineer added");
        Navigator.pop(context);
      } else if (event is EngineerAddFailure) {
        BotToast.showText(text: event.message);
      }
    });
  }
}
