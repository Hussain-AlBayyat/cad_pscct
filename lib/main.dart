import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:pscct/blocs/login_bloc/login_bloc.dart';
import 'package:pscct/blocs/procurement_bloc/procurement_bloc.dart';
import 'package:pscct/router.dart';
import 'package:pscct/screens/intro_video.dart';
import 'package:pscct/screens/landing_page/landing_screen.dart';
import 'package:pscct/screens/sign_in/sign_in_screen.dart';
import 'package:pscct/services/auth_service.dart';
import 'package:pscct/size_config.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'Theme/theme.dart';

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
  @override
  void initState() {
    setupSession();
    super.initState();
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
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Supply Chain',
            theme: AppTheme.android,
            navigatorKey: NavigationService.navigationKey,
            onGenerateRoute: AppRouter.generateRoute,
            builder: (context, child) => ResponsiveWrapper.builder(
                  child,
                  maxWidth: 1200,
                  minWidth: 480,
                  defaultScale: true,
                  breakpoints: const [
                    ResponsiveBreakpoint.autoScale(480, name: MOBILE),
                    ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    ResponsiveBreakpoint.autoScale(1024, name: DESKTOP),
                  ],
                ),
            home: LandingPageScreen() //LoginScreen(),
            ),
      ),
    ); //LandingPageScreen());
  }
}
