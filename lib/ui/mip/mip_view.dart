import 'package:accreditation_management_system/core/base/functions/base_functions.dart';
import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:accreditation_management_system/core/navigation/navigation.dart';
import 'package:accreditation_management_system/repository/mip_repository.dart';
import 'package:accreditation_management_system/ui/shared/widget/head_title_widget.dart';
import 'package:accreditation_management_system/ui/shared/widget/list_card.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MipView extends StatefulWidget {
  const MipView({super.key});

  @override
  State<MipView> createState() => _MipViewState();
}

class _MipViewState extends State<MipView> {

  @override
  void initState() {
    context.read<IMipRepository>().getAll();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("MIPs"),
        flexibleSpace: appBarLinearGradient(),
      ),
      body: Column(
        children: [
          Expanded(
            child:ListView.builder(
                itemCount: 20,
                itemBuilder: (context,index){
                  return ListCard(text: 'MIP $index', cardColor: context.mipColor, onTap: (){
                    context.router.push(MipDetailViewRoute());
                  });
                }
            ),
          )
        ],
      ),
    );
  }
}
