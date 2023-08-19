import 'package:accreditation_management_system/core/base/functions/base_functions.dart';
import 'package:accreditation_management_system/core/extensions/context_extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/components/animation/tap_animation.dart';
import '../../core/constants/image_constants.dart';
import '../../core/navigation/navigation.dart';

@RoutePage()
class DashboardView extends StatelessWidget {
  const DashboardView({super.key, required this.username});

  final String username;

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
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              )),
          IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () {
                context.router.replace(LoginViewRoute());
              }),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            children: [
              Expanded(
                  child: TapAnimation(
                child: Container(
                  margin: const EdgeInsets.all(2),
                  padding: context.edgeLow,
                  width: context.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [context.mipColor, context.learningPathColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: context.radiusAll),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.sunny,
                        color: Colors.white,
                      ),
                      Text("Günaydın",
                          style: context.textTheme.displaySmall!
                              .copyWith(fontSize: 22, color: Colors.white)),
                      Text(
                        username ?? "Berkay Aydemir",
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
                            Expanded(
                                child: GestureDetector(
                                    onTap: () {},
                                    child: buildBox(
                                        context, context.mipColor, 'MIPs', () {
                                      context.router.push(MipViewRoute());
                                    }))),
                            Expanded(
                                child: buildBox(
                                    context, context.engineerColor, 'Engineers',
                                    () {
                              context.router.push(EngineerViewRoute());
                            })),
                          ],
                        ),
                      ),
                      Expanded(
                          child: buildBox(context, context.learningPathColor,
                              'Learning\nPaths', () {
                        context.router.push(LearningPathViewRoute());
                      })),
                    ],
                  )),
              Expanded(
                  child: buildBox(
                      context, context.accreditationColor, 'Accreditations',
                      () {
                context.router.push(AccreditationViewRoute());
              })),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBox(
      BuildContext context, Color color, String title, VoidCallback onTap) {
    return TapAnimation(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: context.edgeLow,
          margin: EdgeInsets.all(2),
          decoration:
              BoxDecoration(color: color, borderRadius: context.radiusAll),
          child: Center(
              child: Text(
            title,
            style: context.textTheme.displaySmall!
                .copyWith(fontSize: context.height * 0.03, color: Colors.white),
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}
