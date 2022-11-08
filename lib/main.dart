import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:pscct/screens/landing_page/landing_screen.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:pscct/router.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                ResponsiveBreakpoint.resize(730, name: TABLET),
                ResponsiveBreakpoint.autoScale(1024, name: DESKTOP),
              ],
            ),
        home: LandingPageScreen());
  }
}
