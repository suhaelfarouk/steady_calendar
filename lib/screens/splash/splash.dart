import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const routeName = '/';

  final State<Splash> state;

  const Splash({super.key, required this.state});

  @override
  // ignore: no_logic_in_create_state
  State<Splash> createState() => state;
}
