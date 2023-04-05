import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../providers/session_provider.dart';
import '../cal_pager/cal_pager.dart';
import '../intro/intro.dart';
import 'splash.dart';
import 'package:provider/provider.dart' as provider;

final supabase = Supabase.instance.client;

class SplashState extends State<Splash> {
  SplashState();
  @override
  void initState() {
    super.initState();
    listenToAuthState();
  }

  login() async {
    provider.Provider.of<SessionProvider>(context, listen: false)
        .refreshCalendars();

    Navigator.of(context).pushNamedAndRemoveUntil(
        CalPager.routeName, ModalRoute.withName(Splash.routeName));
  }

  logout(BuildContext context) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
        Intro.routeName, ModalRoute.withName(Splash.routeName));
  }

  StreamSubscription<AuthState> listenToAuthState() {
    return supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;

      switch (event) {
        case AuthChangeEvent.signedIn:
          if (session != null) {
            login();
          }
          break;
        case AuthChangeEvent.signedOut:
          if (session == null) {
            logout(context);
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
