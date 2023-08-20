import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/core/navigation/navigation.dart';
import 'package:accreditation_management_system/ui/shared/widget/field_and_value_widget.dart';
import 'package:accreditation_management_system/ui/shared/widget/field_title_widget.dart';
import 'package:accreditation_management_system/ui/shared/widget/head_title_widget.dart';
import 'package:accreditation_management_system/ui/shared/widget/property_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/image_constants.dart';
import '../../core/components/indicator/loading_indicator.dart';
import '../../core/constants/local_storage_constants.dart';
import '../../core/constants/microsoft_colors.dart';
import '../../core/local_storage/local_storage_manager.dart';
import '../../repository/user_repository.dart';
import 'bloc/engineer_bloc.dart';

@RoutePage()
class EngineerDetailView extends StatefulWidget {
  const EngineerDetailView({super.key, @PathParam('id') required this.engineerID});
  final int engineerID;

  @override
  State<StatefulWidget> createState() => _EngineerViewState();
}

class _EngineerViewState extends State<EngineerDetailView> {
  late EngineerBloc _engineersDetailBloc;
  late String username;
  @override
  void initState() {
    _engineersDetailBloc = EngineerBloc(engineerRepository: RepositoryProvider.of<IUserRepository>(context));
    _engineersDetailBloc.add(EngineerDetailFetch(id: widget.engineerID));
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: context.edgeNormal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<EngineerBloc, EngineerState>(
                        bloc: _engineersDetailBloc,
                        builder: (context, state) {
                          if (state is EngineerDetailSuccess) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FieldAndValueWidget(
                                    title: "İsim",
                                    value: "${state.engineer.firstName} ${state.engineer.lastName}",
                                    headTitleColor: context.engineerColor),
                                SizedBox(
                                  height: context.height * 0.02,
                                ),
                                FieldAndValueWidget(
                                    title: "E-Posta", value: state.engineer.email ?? "unknown-mail", headTitleColor: context.engineerColor),
                                SizedBox(
                                  height: context.height * 0.02,
                                ),
                                FieldAndValueWidget(
                                    title: "Rol", value: getUserRole(state.engineer.userRole ?? 0), headTitleColor: context.engineerColor),
                                SizedBox(
                                  height: context.height * 0.02,
                                ),
                                FieldTitleWidget(title: "Accreditations", backgroundColor: context.accreditationColor),
                                /* if (state.engineer.accreditations!.isEmpty)
                                  SizedBox(
                                      height: context.height * 0.1,
                                      child: const Center(
                                        child: Text("No Accreditations"),
                                      )),*/
                              ],
                            );
                          }

                          if (state is EngineerDetailLoading) {
                            return SizedBox(
                                height: context.height * 0.5,
                                width: context.width * 0.5,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ));
                          }
                          return const Center(
                            child: Text("Error"),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: context.height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton.outlined(
                  onPressed: _alert,
                  icon: const Icon(Icons.delete),
                  color: MicrosoftColor.RED,
                ),
                ElevatedButton(
                  onPressed: _switchEngineer,
                  child: BlocBuilder<EngineerBloc, EngineerState>(
                    bloc: _engineersDetailBloc,
                    builder: (context, state) {
                      if (state is EngineerDetailSuccess) {
                        username = state.engineer.firstName!;
                        return Text(
                          "Continue as $username",
                          style: context.textTheme.bodyMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      }
                      return const LoadingIndicator();
                    },
                  ),
                ),
                IconButton.outlined(
                  onPressed: _editEngineer,
                  icon: const Icon(Icons.edit),
                  color: MicrosoftColor.BLUE,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getUserRole(int userRole) {
    switch (userRole) {
      case 1:
        return "Engineer";
      case 2:
        return "Admin";
      default:
        return "Observer";
    }
  }

  void _switchEngineer() {
    LocalStorageManager.setString(LocalStorageConstants.USERNAME, widget.engineerID.toString());
    context.router.replaceAll([DashboardViewRoute(username: username)]);
  }

  void _editEngineer() {
    context.router.push(EngineerEditViewRoute(engineerID: widget.engineerID));
  }

  void _alert() {
    AlertDialog alertDialog = AlertDialog(
      title: Text("Delete Engineer"),
      content: Text("Are you sure you want to delete this engineer?"),
      actions: [
        TextButton(onPressed: _deleteEngineer, child: Text("Yes")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "No",
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
      ],
    );

    showDialog(
      context: context,
      builder: (context) => alertDialog,
      barrierDismissible: false,
    );
  }

  void _deleteEngineer() {
    _engineersDetailBloc.add(EngineerDelete(id: widget.engineerID));
    context.router.popUntilRouteWithPath('/engineer');
  }
}
