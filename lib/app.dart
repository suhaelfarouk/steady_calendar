import 'package:flutter/material.dart';

import 'screens/cal_pager/cal_pager.dart';
import 'screens/intro/intro.dart';
import 'screens/login_options/login_options.dart';
import 'screens/splash/splash.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Steady Calendar',
        initialRoute: Intro.routeName, // TODO change to Splash.routeName
        routes: {
          Splash.routeName: (context) => const Splash(),
          Intro.routeName: (context) => const Intro(),
          LoginOptions.routeName: (context) => const LoginOptions(),
          CalPager.routeName: (context) => const CalPager(),
        });
  }
}
