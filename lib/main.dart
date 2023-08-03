
import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/base/bloc/app_bloc_observer.dart';
import 'core/dependency_injection.dart';
import 'core/navigation/navigation.dart';
import 'core/notifier/theme_notifier.dart';

Future main() async {
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver.instance;
  HttpOverrides.global = MyHttpOverrides();
  runZoned(
        () {
      runApp(
        const MyApp(),
      );
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  final botToastBuilder = BotToastInit();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp.router(
      title: 'Accreditation Management System',
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () => [BotToastNavigatorObserver()],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
          systemOverlayStyle: SystemUiOverlayStyle.dark
        )
      ),
      builder: (context, child) {
        ScreenUtil.init(
          context,
          designSize: const Size(360, 690),
          minTextAdapt: true,
          // splitScreenMode: true,
        );
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0, ),
            child: botToastBuilder.call(context, child));
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}