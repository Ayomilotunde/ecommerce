import 'dart:convert';

import 'package:ecommerce/screens/login/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../components/auth_logo_heading.dart';
import '../../components/custom_label_text_form_field.dart';
import '../../constants/app_constants.dart';
import '../../services/networking/web_apis/user_api.dart';
import '../../utils/button.dart';
import '../../utils/next_screen.dart';
import '../../utils/snackbar.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColour,
        elevation: 0,
      ),
      body: LoadingOverlay(
        isLoading: isLoading,
        progressIndicator: const CircularProgressIndicator.adaptive(),
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AuthHeading(
                  heading: 'Create Account',
                  subHeading: '',
                ),
                k30VerticalSpacing,
                CustomLabelInputText(
                  label: 'Full name',
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  inputAction: TextInputAction.next,
                  placeholder: 'Enter your full name',
                ),
                k20VerticalSpacing,
                CustomLabelInputText(
                  label: 'Email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  placeholder: 'Enter your email',
                ),
                k20VerticalSpacing,
                CustomLabelInputText(
                  label: 'Enter Password',
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  inputAction: TextInputAction.done,
                  placeholder: '*******',
                ),

                k20VerticalSpacing,
                Button(
                  onPressed: () {
                    _submitRegistration(context);
                  },
                  text: 'Create Account',
                  color: kButtonColour2,
                  textColor: kPrimaryColour,
                ),
                k30VerticalSpacing,
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Login',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: kPrimaryColour,
                                fontSize: 14),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pop();
                              }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _submitRegistration(BuildContext context) async {
    if (emailController.text.isEmpty) {
      return openSnackBar(context, 'Input your email', kPrimaryColour);
    }
    if(nameController.text.isEmpty){
      return openSnackBar(context, 'Input your full name', kPrimaryColour);
    }
    if(passwordController.text.isEmpty){
      return openSnackBar(context, 'Input your password', kPrimaryColour);
    }

    return  await registerUser(context);

  }

  Future<void> registerUser(context) async {
      _makeLoadingTrue();
      final res = await UserApi.createUser(
          email: emailController.text, password: passwordController.text, fullName: nameController.text);
      final data = jsonDecode(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        _makeLoadingFalse();
        if (!mounted) return;

        openSnackBar(context, "Account Creation Successful", kPrimaryColour);
        nextScreenReplace(context, const LoginScreen());
      } else {
        _makeLoadingFalse();
        if (!mounted) return;
        openSnackBar(context, "Error: Could not login account", kPrimaryColour);
  }}
  void _makeLoadingFalse() {
    setState(() {
      isLoading = false;
    });
  }

  void _makeLoadingTrue() {
    setState(() {
      isLoading = true;
    });
  }
}
