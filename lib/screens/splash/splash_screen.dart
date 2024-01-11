import 'dart:async';

import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../utils/next_screen.dart';
import '../login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {

    Timer(
      const Duration(seconds: 3),
      () => nextScreenReplace(
        context,
       const LoginScreen(),
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashBackgroundColour,
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


}
