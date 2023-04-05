import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'providers/session_provider.dart';
import 'repositories/cal_repo.dart';
import 'repositories/cal_repo_interface.dart';
import 'screens/cal_pager/cal_pager.dart';
import 'screens/intro/intro.dart';
import 'screens/login_options/login_options.dart';
import 'screens/splash/splash.dart';
import 'screens/splash/splash_state.dart';

class App extends StatelessWidget {
  final State<Splash> splashState;
  const App({super.key, required this.splashState});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Steady Calendar',
        initialRoute: Splash.routeName, // TODO change to Splash.routeName
        routes: {
          Splash.routeName: (context) => Splash(state: splashState),
          Intro.routeName: (context) => const Intro(),
          LoginOptions.routeName: (context) => const LoginOptions(),
          CalPager.routeName: (context) => const CalPager(),
        });
  }
}

/// Performs initialization steps and then runs our app.
Future<void> runAppWithOptions(
    {String envFileName = '.env',
    CalRepoInterface calendarRepository = const CalendarRepository(),
    required State<Splash> splashState}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: envFileName);

  await Supabase.initialize(
      url: 'https://${dotenv.env['SUPABASE_PROJECT_ID']!}.supabase.co',
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
      debug: false);

  runApp(ChangeNotifierProvider(
      create: (context) => SessionProvider(calendarRepository),
      child: App(splashState: splashState)));
}
