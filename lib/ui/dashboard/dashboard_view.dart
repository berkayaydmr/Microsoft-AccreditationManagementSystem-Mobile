import 'package:accreditation_management_system/core/base/functions/base_functions.dart';
import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/components/animation/tap_animation.dart';
import '../../core/constants/image_constants.dart';
import '../../core/navigation/navigation.dart';

@RoutePage()
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> microsoftColors = [
      const Color(0xFFBA1A1A),
      const Color(0xFF7FBA00),
      const Color(0xFF00A4EF),
      const Color(0xFFFFB900),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text("Accreditation Management System", style: context.textTheme.displayMedium!.copyWith(fontSize: 15, color: Colors.white),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.person, color: Colors.white,)),
          IconButton(icon: const Icon(Icons.logout, color: Colors.white,), onPressed: (){
          }),
        ],
        flexibleSpace: appBarLinearGradient()
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            children: [
              Expanded(child: TapAnimation(
                child: Container(
                  margin: EdgeInsets.all(2),
                  padding: context.edgeLow,
                  width: context.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [microsoftColors[0], microsoftColors[2]],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: context.radiusAll),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sunny, color: Colors.white,),
                      Text("Günaydın",
                          style: context.textTheme.displaySmall!
                              .copyWith(fontSize: 22, color: Colors.white)),
                      Text(
                        'Emir Safa',
                        style: context.textTheme.displaySmall!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(child: GestureDetector(
                                onTap: (){
                                },
                                child: buildBox(context, microsoftColors[0], 'MIPs', (){context.router.push(MipViewRoute());}))
                            ),
                            Expanded(child: buildBox(context, microsoftColors[1], 'Engineers', (){context.router.push(EngineerViewRoute());})),
                          ],
                        ),
                      ),
                      Expanded(child: buildBox(context, microsoftColors[2], 'Learning\nPaths', (){context.router.push(LearningPathViewRoute());})),
                    ],
                  )),
              Expanded(child: buildBox(context, microsoftColors[3], 'Accreditations', (){context.router.push(AccreditationViewRoute());})),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBox(BuildContext context, Color color, String title, VoidCallback onTap) {
    return TapAnimation(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: context.edgeLow,
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(color: color, borderRadius: context.radiusAll),
          child: Center(child: Text(title, style: context.textTheme.displaySmall!.copyWith(fontSize: context.height * 0.03, color: Colors.white), textAlign: TextAlign.center,)),
        ),
      ),
    );
  }
}
