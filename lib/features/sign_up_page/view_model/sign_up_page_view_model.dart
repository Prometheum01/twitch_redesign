import 'package:flutter/material.dart';
import 'package:twitch_design/features/home_page/view/home_page_view.dart';
import 'package:twitch_design/features/sign_up_page/view/sign_up_page_view.dart';
import 'package:twitch_design/product/mixin/password_visibility.dart';

abstract class SignUpPageViewModel extends State<SignUpPageView>
    with PasswordVisibilityMixin {
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late TextEditingController dateController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    dateController = TextEditingController();
  }

  checkValidator() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePageView(),
        ),
      );
    }
  }
}
