// flutter specific imports
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'config/themes/custom_theme.dart';
import 'config/themes/theme_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

// operational file imports
import 'package:flutter_seed/l10n/l_10n.dart';
import 'package:flutter_seed/views/authentication/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_seed/views/authentication/repos/login_repositories.dart';
import 'config/environment/environment.dart';
import 'config/routes/routes.dart'; 

void main() {
  // environment initialization
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.dev,
  );
  Environment().initConfig(environment);

  _initTalker(); // initialize takker

  //runZonedGuarded : If an error occurs synchronously in [body],
  runZonedGuarded(() {
    runApp(const MyApp());
  }, (Object error, StackTrace stack) {
    GetIt.instance<Talker>().handle(error, stack, 'Uncaught app exception');
  });
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => LoginRepository(),
        ),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
              create: (context) => AuthenticationBloc(
                  RepositoryProvider.of<LoginRepository>(context)),
            ),
          ],
          child: ChangeNotifierProvider(
              create: (context) => ThemeProvider(),
              builder: (context, _) {
                final themeProvider = Provider.of<ThemeProvider>(context);
                return MaterialApp(
                  title: 'Flutter Seed',
                  locale: const Locale('en', 'US'),
                  darkTheme: AppTheme.darkTheme,
                  theme: AppTheme.lightTheme,
                  themeMode: themeProvider.themeMode,
                  supportedLocales: L10n.all,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  routes: Routes.routes,
                  initialRoute: RoutePath.login,
                  builder: (context, child) {
                    return TalkerWrapper(
                      talker: GetIt.instance<Talker>(),
                      child: child!,
                    );
                  },
                );
              })),
    );
  }
}

void _initTalker() {
  // initialize talker
  final talker = TalkerFlutter.init();

  // add talker to get it instance
  GetIt.instance.registerSingleton<Talker>(talker);
  final talkerDioLogger = TalkerDioLogger(
    talker: GetIt.instance<Talker>(),
    settings: const TalkerDioLoggerSettings(
      printRequestHeaders: true,
      printResponseHeaders: true,
      printRequestData: true,
      printResponseData: true,
    ),
  );
  GetIt.instance.registerSingleton(talkerDioLogger);
}
