import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../repository/accreditation_repository.dart';
import '../repository/learning_path_repository.dart';
import '../repository/mip_repository.dart';
import '../repository/user_repository.dart';

class DependencyInjector {
  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    _instance ??= DependencyInjector._init();
    return _instance!;
  }

  //late final IHomeService homeService;
  //late final HomeBloc homeBloc;
  late final IAccreditationRepository accreditationRepository;
  late final IUserRepository engineerRepository;
  late final ILearningPathRepository learningPathRepository;
  late final IMipRepository mipRepository;

  DependencyInjector._init() {
    //homeService = HomeService();
    //homeBloc = HomeBloc(homeService);
    accreditationRepository = AccreditationRepository();
    engineerRepository = UserRepository();
    learningPathRepository = LearningPathRepository();
    mipRepository = MipRepository();
  }

  List<RepositoryProvider> get repositoryProviders => [
        //RepositoryProvider<IHomeService>(create: (context) => homeService),
        RepositoryProvider<IAccreditationRepository>(create: (context) => accreditationRepository),
        RepositoryProvider<IUserRepository>(create: (context) => engineerRepository),
        RepositoryProvider<ILearningPathRepository>(create: (context) => learningPathRepository),
        RepositoryProvider<IMipRepository>(create: (context) => mipRepository),
      ];

  List<BlocProvider<Bloc>> get globalBlocProviders => [
        //BlocProvider<HomeBloc>(create: (context) => homeBloc),
      ];

  List<ChangeNotifierProvider<ChangeNotifier>> get otherProviders => [];
}
