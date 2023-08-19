import 'package:accreditation_management_system/core/constants/microsoft_colors.dart';
import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/ui/engineer/bloc/engineer_bloc.dart';
import 'package:accreditation_management_system/ui/shared/widget/head_title_widget.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/image_constants.dart';
import '../../core/navigation/navigation.dart';
import '../../repository/engineer_repository.dart';
import '../shared/widget/list_card.dart';

@RoutePage()
class EngineerView extends StatefulWidget {
  const EngineerView({super.key});

  @override
  State<EngineerView> createState() => _EngineerViewState();
}

class _EngineerViewState extends State<EngineerView> {
  EngineerBloc? _engineersBloc;

  @override
  void initState() {
    _engineersBloc = EngineerBloc(engineerRepository: RepositoryProvider.of<IEngineerRepository>(context));

    _engineersBloc!.add(EngineerListFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Engineers", style: TextStyle(color: MicrosoftColor.GREEN)),
        actions: [
          IconButton(
              onPressed: () {
                context.router.push(const EngineerAddViewRoute());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                _engineersBloc!.add(EngineerListFetch());
              },
              child: BlocBuilder<EngineerBloc, EngineerState>(
                bloc: _engineersBloc,
                builder: (context, state) {
                  if (state is EngineerListLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is EngineerListFailure) {
                    return Center(child: Text(state.message));
                  } else if (state is EngineerListSuccess) {
                    return ListView.builder(
                        itemCount: state.engineers.length,
                        itemBuilder: (context, index) {
                          return ListCard(
                              text: "${state.engineers[index].firstName} ${state.engineers[index].lastName}" ?? "Unknown",
                              cardColor: context.engineerColor,
                              onTap: () {
                                context.router.push(EngineerDetailViewRoute(engineerID: state.engineers[index].id!));
                              });
                        });
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
