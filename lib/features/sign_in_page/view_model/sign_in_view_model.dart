import 'package:flutter/material.dart';
import 'package:twitch_design/features/landing_page/landing_page_view.dart';
import 'package:twitch_design/features/sign_in_page/view/sign_in_view.dart';

abstract class SignInViewModel extends State<SignInView> {
  bool isVisible = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  changePasswordVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  checkValidator() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LandingPage(),
        ),
      );
    }
  }
}
