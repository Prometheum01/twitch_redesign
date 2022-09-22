import 'package:flutter/material.dart';
import 'package:twitch_design/features/sign_in_page/view/sign_in_view.dart';

abstract class SignInViewModel extends State<SignInView> {
  bool isVisible = false;
  bool rememberMe = false;

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
}
