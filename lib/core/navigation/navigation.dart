// @CupertinoAutoRouter
// @MaterialAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../ui/accreditation/accreditation_view.dart';
import '../../ui/dashboard/dashboard_view.dart';
import '../../ui/engineer/engineer_view.dart';
import '../../ui/learning_path/learning_path_view.dart';
import '../../ui/mip/mip_detail_view.dart';
import '../../ui/mip/mip_view.dart';

part 'navigation.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route,Screen',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
        path: '/',
        page: DashboardViewRoute.page
    ),
    AutoRoute(
        path: '/accreditation',
        page: AccreditationViewRoute.page
    ),
    AutoRoute(
        path: '/engineer',
        page: EngineerViewRoute.page
    ),
    AutoRoute(
        path: '/learningPath',
        page: LearningPathViewRoute.page
    ),
    AutoRoute(
        path: '/mip',
        page: MipViewRoute.page
    ),
    AutoRoute(
        path: '/mip/:id',
        page: MipDetailViewRoute.page
    ),
  ];
}

Route<T> heroDialogRoute<T>(
    BuildContext context, Widget child, AutoRoutePage<T> page) {
  return PageRouteBuilder(
      fullscreenDialog: page.fullscreenDialog,
      opaque: false,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 500),
      maintainState: true,
      barrierColor: Colors.black54,
      settings: page,
      pageBuilder: (context, animation, secondaryAnimation) =>
          FadeTransition(opacity: animation, child: child));
}

Route<T> noAnimationMaterialPageRoute<T>(
    BuildContext context, Widget child, AutoRoutePage<T> page) {
  return PageRouteBuilder(
      maintainState: true,
      fullscreenDialog: false,
      settings: page,
      pageBuilder: (context, animation, secondaryAnimation) =>
          FadeTransition(opacity: animation, child: child));
}
