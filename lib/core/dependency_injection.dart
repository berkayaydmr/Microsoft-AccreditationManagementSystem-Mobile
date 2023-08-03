import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


class DependencyInjector {
  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    _instance ??= DependencyInjector._init();
    return _instance!;
  }

  //late final IHomeService homeService;
  //late final HomeBloc homeBloc;
  DependencyInjector._init() {
    //homeService = HomeService();
    //homeBloc = HomeBloc(homeService);
  }

  List<RepositoryProvider> get repositoryProviders => [
    //RepositoryProvider<IHomeService>(create: (context) => homeService),
  ];

  List<BlocProvider<Bloc>> get globalBlocProviders => [
    //BlocProvider<HomeBloc>(create: (context) => homeBloc),
  ];

  List<ChangeNotifierProvider<ChangeNotifier>> get otherProviders => [

  ];
}
