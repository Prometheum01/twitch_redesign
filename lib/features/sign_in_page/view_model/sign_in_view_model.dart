import 'package:flutter/material.dart';
import 'package:twitch_design/features/select_category_page/view/select_category_page.dart';
import 'package:twitch_design/features/sign_in_page/view/sign_in_view.dart';
import 'package:twitch_design/product/mixin/password_visibility.dart';

abstract class SignInViewModel extends State<SignInView>
    with PasswordVisibilityMixin {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  checkValidator() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SelectCategoryView(),
        ),
      );
    }
  }
}
