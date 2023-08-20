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
    AccreditationDetailViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccreditationDetailView(),
      );
    },
    AccreditationViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccreditationView(),
      );
    },
    DashboardViewRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashboardView(
          key: args.key,
          username: args.username,
        ),
      );
    },
    EngineerAddViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EngineerAddView(),
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
    EngineerEditViewRoute.name: (routeData) {
      final args = routeData.argsAs<EngineerEditViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EngineerEditView(
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
    LearningPathDetailViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LearningPathDetailView(),
      );
    },
    LearningPathEditViewRoute.name: (routeData) {
      final args = routeData.argsAs<LearningPathEditViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LearningPathEditView(
          key: args.key,
          learningPathID: args.learningPathID,
        ),
      );
    },
    LearningPathViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LearningPathView(),
      );
    },
    LoginViewRoute.name: (routeData) {
      final args = routeData.argsAs<LoginViewRouteArgs>(
          orElse: () => const LoginViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginView(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    MipAddViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MipAddView(),
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
/// [AccreditationDetailView]
class AccreditationDetailViewRoute extends PageRouteInfo<void> {
  const AccreditationDetailViewRoute({List<PageRouteInfo>? children})
      : super(
          AccreditationDetailViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccreditationDetailViewRoute';

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
/// [DashboardView]
class DashboardViewRoute extends PageRouteInfo<DashboardViewRouteArgs> {
  DashboardViewRoute({
    Key? key,
    required String username,
    List<PageRouteInfo>? children,
  }) : super(
          DashboardViewRoute.name,
          args: DashboardViewRouteArgs(
            key: key,
            username: username,
          ),
          initialChildren: children,
        );

  static const String name = 'DashboardViewRoute';

  static const PageInfo<DashboardViewRouteArgs> page =
      PageInfo<DashboardViewRouteArgs>(name);
}

class DashboardViewRouteArgs {
  const DashboardViewRouteArgs({
    this.key,
    required this.username,
  });

  final Key? key;

  final String username;

  @override
  String toString() {
    return 'DashboardViewRouteArgs{key: $key, username: $username}';
  }
}

/// generated route for
/// [EngineerAddView]
class EngineerAddViewRoute extends PageRouteInfo<void> {
  const EngineerAddViewRoute({List<PageRouteInfo>? children})
      : super(
          EngineerAddViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'EngineerAddViewRoute';

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
/// [EngineerEditView]
class EngineerEditViewRoute extends PageRouteInfo<EngineerEditViewRouteArgs> {
  EngineerEditViewRoute({
    Key? key,
    required int engineerID,
    List<PageRouteInfo>? children,
  }) : super(
          EngineerEditViewRoute.name,
          args: EngineerEditViewRouteArgs(
            key: key,
            engineerID: engineerID,
          ),
          initialChildren: children,
        );

  static const String name = 'EngineerEditViewRoute';

  static const PageInfo<EngineerEditViewRouteArgs> page =
      PageInfo<EngineerEditViewRouteArgs>(name);
}

class EngineerEditViewRouteArgs {
  const EngineerEditViewRouteArgs({
    this.key,
    required this.engineerID,
  });

  final Key? key;

  final int engineerID;

  @override
  String toString() {
    return 'EngineerEditViewRouteArgs{key: $key, engineerID: $engineerID}';
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
/// [LearningPathDetailView]
class LearningPathDetailViewRoute extends PageRouteInfo<void> {
  const LearningPathDetailViewRoute({List<PageRouteInfo>? children})
      : super(
          LearningPathDetailViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'LearningPathDetailViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LearningPathEditView]
class LearningPathEditViewRoute
    extends PageRouteInfo<LearningPathEditViewRouteArgs> {
  LearningPathEditViewRoute({
    Key? key,
    required int learningPathID,
    List<PageRouteInfo>? children,
  }) : super(
          LearningPathEditViewRoute.name,
          args: LearningPathEditViewRouteArgs(
            key: key,
            learningPathID: learningPathID,
          ),
          initialChildren: children,
        );

  static const String name = 'LearningPathEditViewRoute';

  static const PageInfo<LearningPathEditViewRouteArgs> page =
      PageInfo<LearningPathEditViewRouteArgs>(name);
}

class LearningPathEditViewRouteArgs {
  const LearningPathEditViewRouteArgs({
    this.key,
    required this.learningPathID,
  });

  final Key? key;

  final int learningPathID;

  @override
  String toString() {
    return 'LearningPathEditViewRouteArgs{key: $key, learningPathID: $learningPathID}';
  }
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
/// [LoginView]
class LoginViewRoute extends PageRouteInfo<LoginViewRouteArgs> {
  LoginViewRoute({
    Key? key,
    void Function(bool)? onResult,
    List<PageRouteInfo>? children,
  }) : super(
          LoginViewRoute.name,
          args: LoginViewRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginViewRoute';

  static const PageInfo<LoginViewRouteArgs> page =
      PageInfo<LoginViewRouteArgs>(name);
}

class LoginViewRouteArgs {
  const LoginViewRouteArgs({
    this.key,
    this.onResult,
  });

  final Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginViewRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [MipAddView]
class MipAddViewRoute extends PageRouteInfo<void> {
  const MipAddViewRoute({List<PageRouteInfo>? children})
      : super(
          MipAddViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'MipAddViewRoute';

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
