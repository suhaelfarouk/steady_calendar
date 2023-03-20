import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const String routeName = '/';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CircularProgressIndicator(),
    );
  }
}
