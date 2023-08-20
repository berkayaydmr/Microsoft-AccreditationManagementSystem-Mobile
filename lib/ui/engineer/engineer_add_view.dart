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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _engineerBloc =
        EngineerBloc(engineerRepository: RepositoryProvider.of<IUserRepository>(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kayıt Ol", style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        padding: context.edgeNormalHorizontal,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 50,),
              Image.asset(
                ImageConstants.instance.logo,
                height: context.height * 0.1,
                cacheHeight: 200,
              ),
              SizedBox(height: 25,),
              Column(
                children: [
                  _buildTextField(
                    controller: engineerMailController,
                    hintText: "Mail",
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _buildTextField(
                    controller: engineerUsernameController,
                    hintText: "Username",
                    icon: Icons.person,
                  ),
                  _buildTextField(
                    controller: engineerPasswordController,
                    hintText: "Password",
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  _buildTextField(
                    controller: engineerNameController,
                    hintText: "Name",
                    icon: Icons.person,
                  ),
                  _buildTextField(
                    controller: engineerSurnameController,
                    hintText: "Surname",
                    icon: Icons.person,
                  ),
                ],
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: context.radiusAll,
                  ),
                  fixedSize: Size.fromWidth(context.width),
                ),
                onPressed: _createEngineer,
                child: const Text("Register As a Engineer"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      margin: context.edgeLowVertical,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: context.textTheme.titleMedium,
            border: OutlineInputBorder(
              borderRadius: context.radiusAll,
            ),
            errorMaxLines: 3,
            icon: Icon(icon), // Add icon
          ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a valid $hintText';
          }
          return null;
        },
      ),
    );
  }

  void _createEngineer() {
    if (_formKey.currentState?.validate() ?? false) {
      _engineerBloc.add(EngineerAddButtonPressed(
        engineer: PostUserRequestModel(
          email: engineerMailController.text,
          username: engineerUsernameController.text,
          password: engineerPasswordController.text,
          firstName: engineerNameController.text,
          lastname: engineerSurnameController.text,
          userRole: 1,
        ),
      ));

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
}
