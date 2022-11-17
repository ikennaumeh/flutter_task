import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/app/app.locator.dart';
import 'core/app/app.router.dart';
import 'core/utils/palette.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter task',
      theme: ThemeData(
          scaffoldBackgroundColor: Palette.white,
          appBarTheme: AppBarTheme(
              backgroundColor: Palette.white,
              elevation: 0
          ),
          fontFamily: GoogleFonts.nunito().fontFamily,
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android : CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS : ZoomPageTransitionsBuilder(),
              }
          )
      ),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}


