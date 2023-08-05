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
    AccreditationViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccreditationView(),
      );
    },
    DashboardViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
      );
    },
    EngineerDetailViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EngineerDetailViewRouteArgs>(
          orElse: () =>
              EngineerDetailViewRouteArgs(engineerID: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EngineerDetailView(
          key: args.key,
          engineerID: args.engineerID,
        ),
      );
    },
    EngineerViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EngineerView(),
      );
    },
    LearningPathViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LearningPathView(),
      );
    },
    MipDetailViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MipDetailView(),
      );
    },
    MipViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MipView(),
      );
    },
  };
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
/// [EngineerDetailView]
class EngineerDetailViewRoute
    extends PageRouteInfo<EngineerDetailViewRouteArgs> {
  EngineerDetailViewRoute({
    Key? key,
    required int engineerID,
    List<PageRouteInfo>? children,
  }) : super(
          EngineerDetailViewRoute.name,
          args: EngineerDetailViewRouteArgs(
            key: key,
            engineerID: engineerID,
          ),
          rawPathParams: {'id': engineerID},
          initialChildren: children,
        );

  static const String name = 'EngineerDetailViewRoute';

  static const PageInfo<EngineerDetailViewRouteArgs> page =
      PageInfo<EngineerDetailViewRouteArgs>(name);
}

class EngineerDetailViewRouteArgs {
  const EngineerDetailViewRouteArgs({
    this.key,
    required this.engineerID,
  });

  final Key? key;

  final int engineerID;

  @override
  String toString() {
    return 'EngineerDetailViewRouteArgs{key: $key, engineerID: $engineerID}';
  }
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
