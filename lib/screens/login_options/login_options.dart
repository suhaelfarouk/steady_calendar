import 'package:flutter/material.dart';

import '../../components/my_flat_button.dart';
import '../../components/my_image_button.dart';
import '../cal_pager/cal_pager.dart';
import '/config/styles.dart';

class LoginOptions extends StatelessWidget {
  static const String routeName = '/intro/login_options';

  const LoginOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pink-plants@3x.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // semi-transparent overlay
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.5),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MyFlatButton(
              const MyImageButton(
                  'assets/images/google-logo-9808.png', 'Continue with Google'),
              textColor: Styles.primaryTextColor,
              backgroundColor: Colors.white,
              onTap: () => _signupTapped(context),
            ),
          ),
        )
      ]),
    );
  }

  Future _signupTapped(BuildContext context) async {
    // NOTE we're simulating login here for now
    Navigator.of(context).pushNamed(CalPager.routeName);
  }
}
