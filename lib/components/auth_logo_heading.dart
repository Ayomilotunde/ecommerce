import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import 'custom_text.dart';

class AuthHeading extends StatelessWidget {
  final String heading;
  final String subHeading;
  const AuthHeading({super.key, required this.heading, required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/logo.png', height: 37, fit: BoxFit.contain,),
          k30VerticalSpacing,
          CustomNunitoText(text: heading, textSize: 20, alignText: TextAlign.center, fontWeight: FontWeight.w500,),
          k10VerticalSpacing,
          CustomNunitoText(text: subHeading, textSize: 14, alignText: TextAlign.center,),
        ],
      ),
    );
  }
}
