import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../cal_pager/cal_pager.dart';
import '../intro/intro.dart';

final supabase = Supabase.instance.client;

class Splash extends StatefulWidget {
  static const String routeName = '/';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    listenToAuthState();
  }

  StreamSubscription<AuthState> listenToAuthState() {
    return supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;

      switch (event) {
        case AuthChangeEvent.signedIn:
          if (session != null) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                CalPager.routeName, ModalRoute.withName(Splash.routeName));
          }
          break;
        case AuthChangeEvent.signedOut:
          if (session == null) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                Intro.routeName, ModalRoute.withName(Splash.routeName));
          }
          break;
        case AuthChangeEvent.tokenRefreshed:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.userUpdated:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.userDeleted:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.mfaChallengeVerified:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.passwordRecovery:
          // TODO: Handle this case.
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CircularProgressIndicator(),
    );
  }
}
