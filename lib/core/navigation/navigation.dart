// @CupertinoAutoRouter
// @MaterialAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../ui/accreditation/accreditation_detail_view.dart';
import '../../ui/accreditation/accreditation_view.dart';
import '../../ui/dashboard/dashboard_view.dart';
import '../../ui/engineer/engineer_add_view.dart';
import '../../ui/engineer/engineer_detail.dart';
import '../../ui/engineer/engineer_edit_view.dart';
import '../../ui/engineer/engineer_view.dart';
import '../../ui/learning_path/learning_path_detail_view.dart';
import '../../ui/learning_path/learning_path_edit_view.dart';
import '../../ui/learning_path/learning_path_view.dart';
import '../../ui/login/login_view.dart';
import '../../ui/mip/mip_add_view.dart';
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
    AutoRoute(path: '/login', page: LoginViewRoute.page, initial: true),
    AutoRoute(path: '/dashboard', page: DashboardViewRoute.page),
    AutoRoute(path: '/accreditation', page: AccreditationViewRoute.page),
    AutoRoute(path: '/learningPath', page: LearningPathViewRoute.page),
    AutoRoute(path: '/learningPath/:id', page: LearningPathDetailViewRoute.page),
    AutoRoute(path: '/mip', page: MipViewRoute.page),
    AutoRoute(path: '/mip/:id', page: MipDetailViewRoute.page),
    AutoRoute(path: '/mip/add', page: MipAddViewRoute.page),
    AutoRoute(path: '/engineer', page: EngineerViewRoute.page),
    AutoRoute(path: '/engineer/:id', page: EngineerDetailViewRoute.page),
    AutoRoute(path: '/engineer/:id/edit', page: EngineerEditViewRoute.page),
    AutoRoute(path: '/engineer/add', page: EngineerAddViewRoute.page),
    AutoRoute(path: '/accreditation/:id', page: AccreditationDetailViewRoute.page),
    AutoRoute(path: '/learningPath/:id/edit', page: LearningPathEditViewRoute.page)
  ];
}

Route<T> heroDialogRoute<T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
  return PageRouteBuilder(
      fullscreenDialog: page.fullscreenDialog,
      opaque: false,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 500),
      maintainState: true,
      barrierColor: Colors.black54,
      settings: page,
      pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(opacity: animation, child: child));
}

Route<T> noAnimationMaterialPageRoute<T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
  return PageRouteBuilder(
      maintainState: true,
      fullscreenDialog: false,
      settings: page,
      pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(opacity: animation, child: child));
}
