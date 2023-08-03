// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'navigation.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LearningPathViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LearningPathView(),
      );
    },
    AccreditationViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccreditationView(),
      );
    },
    MipViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MipView(),
      );
    },
    MipDetailViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MipDetailView(),
      );
    },
    DashboardViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
      );
    },
    EngineerViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EngineerView(),
      );
    },
  };
}

/// generated route for
/// [LearningPathView]
class LearningPathViewRoute extends PageRouteInfo<void> {
  const LearningPathViewRoute({List<PageRouteInfo>? children})
      : super(
          LearningPathViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'LearningPathViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccreditationView]
class AccreditationViewRoute extends PageRouteInfo<void> {
  const AccreditationViewRoute({List<PageRouteInfo>? children})
      : super(
          AccreditationViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccreditationViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MipView]
class MipViewRoute extends PageRouteInfo<void> {
  const MipViewRoute({List<PageRouteInfo>? children})
      : super(
          MipViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'MipViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MipDetailView]
class MipDetailViewRoute extends PageRouteInfo<void> {
  const MipDetailViewRoute({List<PageRouteInfo>? children})
      : super(
          MipDetailViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'MipDetailViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardView]
class DashboardViewRoute extends PageRouteInfo<void> {
  const DashboardViewRoute({List<PageRouteInfo>? children})
      : super(
          DashboardViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EngineerView]
class EngineerViewRoute extends PageRouteInfo<void> {
  const EngineerViewRoute({List<PageRouteInfo>? children})
      : super(
          EngineerViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'EngineerViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
