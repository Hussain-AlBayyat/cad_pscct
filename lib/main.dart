import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:pscct/blocs/login_bloc/login_bloc.dart';
import 'package:pscct/blocs/procurement_bloc/procurement_bloc.dart';
import 'package:pscct/blocs/settings_bloc/settings_state.dart';
import 'package:pscct/router.dart';
import 'package:pscct/screens/intro_video.dart';
import 'package:pscct/services/auth_service.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'Theme/theme.dart';
import 'blocs/settings_bloc/settings_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final int timeout = 30;
  late final sessionConfig;
  late var isDarkTheme;
  @override
  void initState() {
    setupSession();
    super.initState();
  }

  getThemeSettings() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    isDarkTheme = await storage.read(key: "isDarkTheme") ?? false;
  }

  setupSession() {
    sessionConfig = SessionConfig(
      invalidateSessionForAppLostFocus: Duration(minutes: timeout),
      invalidateSessionForUserInactivity: Duration(minutes: timeout),
    );
    sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) async {
      bool isLoggedOut = await AuthService.logout();
      if (isLoggedOut) {
        navService.pushReplacementNamed(AppRouter.loginRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return SessionTimeoutManager(
      sessionConfig: sessionConfig,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
            create: (BuildContext context) => LoginCubit()..initialize(),
          ),
          BlocProvider<ProcurementCubit>(
            create: (BuildContext context) => ProcurementCubit(),
          ),
          BlocProvider<SettingsCubit>(
            create: (BuildContext context) => SettingsCubit()..initialize(),
          ),
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Supply Chain',
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              navigatorKey: NavigationService.navigationKey,
              onGenerateRoute: AppRouter.generateRoute,
              builder: (context, child) => ResponsiveWrapper.builder(
                    child,
                    maxWidth: 1200,
                    minWidth: 480,
                    defaultScale: false,
                    breakpoints: const [
                      ResponsiveBreakpoint.autoScale(480, name: MOBILE),
                      ResponsiveBreakpoint.autoScale(730, name: TABLET),
                      ResponsiveBreakpoint.resize(1024, name: DESKTOP),
                    ],
                  ),
              home: IntroVideo()
              //LoginScreen(),
              );
        }),
      ),
    ); //LandingPageScreen());
  }
}
