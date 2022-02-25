import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:beamer/beamer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:flutter_web_starter/provider/theme.dart';

import 'components/components.dart';
import 'router.dart';

void main() async {
  // load the shared preferences from disk before the app is started
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  // create new theme Provider, which will get the currently selected from shared preferences
  final themeProvider = ThemeProvider(prefs);
  runApp(MyApp(themeProvider: themeProvider));
}

class MyApp extends StatelessWidget {
  final ThemeProvider themeProvider;
  final routerDelegate = BeamerDelegate(
    locationBuilder: (routeInformation, _) => MainLocation(routeInformation),
  );

  MyApp({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Rebuilt App!');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => themeProvider,
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (c, ThemeProvider themeProvider, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.selectedThemeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: AppColors.getMaterialColorFromColor(
                  themeProvider.selectedPrimaryColor),
              primaryColor: themeProvider.selectedPrimaryColor,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: AppColors.getMaterialColorFromColor(
                  themeProvider.selectedPrimaryColor),
              primaryColor: themeProvider.selectedPrimaryColor,
            ),
            builder: (context, widget) => ResponsiveWrapper.builder(
                ClampingScrollWrapper.builder(context, widget!),
                defaultScale: true,
                minWidth: 480,
                defaultName: MOBILE,
                breakpoints: [
                  const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
                  const ResponsiveBreakpoint.resize(600, name: MOBILE),
                  const ResponsiveBreakpoint.resize(850, name: TABLET),
                  const ResponsiveBreakpoint.resize(1080, name: DESKTOP),
                ],
                background: Container(color: background)),
            routeInformationParser: BeamerParser(),
            routerDelegate: routerDelegate,
          );
        },
      ),
    );
  }
}
