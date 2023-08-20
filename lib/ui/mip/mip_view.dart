import 'package:accreditation_management_system/core/base/functions/base_functions.dart';
import 'package:accreditation_management_system/core/constants/microsoft_colors.dart';
import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/core/navigation/navigation.dart';
import 'package:accreditation_management_system/repository/mip_repository.dart';
import 'package:accreditation_management_system/ui/mip/bloc/mip_bloc.dart';
import 'package:accreditation_management_system/ui/shared/widget/list_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/models/mip.dart';
import '../shared/widget/head_title_widget.dart';
import '../shared/widget/nothing_to_show_widget.dart';

@RoutePage()
class MipView extends StatefulWidget {
  const MipView({super.key});

  @override
  State<MipView> createState() => _MipViewState();
}

class _MipViewState extends State<MipView> {
  late MipBloc _mipBloc;

  @override
  void initState() {
    _mipBloc = MipBloc(mipRepository: RepositoryProvider.of<IMipRepository>(context));
    _mipBloc.add(MipFetchAll());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "MIPs",
          style: TextStyle(color: MicrosoftColor.RED),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const MipAddViewRoute());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<MipBloc, MipState>(
          bloc: _mipBloc,
          builder: (context, state) {
            if (state is MipFetchAllSuccess) {
              List<Mip> mips = state.mipList;
              if (mips.isEmpty) {
                return const NothingToShowWidget();
              }

              return Container(
                padding: context.edgeLowVertical,
                height: context.height,
                child: ListView.builder(
                    itemCount: mips.length,
                    itemBuilder: (context, index) {
                      return ListCard(
                          text: 'MIP $index',
                          cardColor: context.mipColor,
                          onTap: () {
                            context.router.push(MipDetailViewRoute());
                          });
                    }),
              );
            }

            if (state is MipFetchAllFailure) {
              return Center(
                child: Text(state.message),
              );
            }

            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
