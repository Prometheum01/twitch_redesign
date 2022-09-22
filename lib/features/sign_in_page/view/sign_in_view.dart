import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:twitch_design/core/const/borders.dart';
import 'package:twitch_design/core/const/paddings.dart';
import 'package:twitch_design/features/sign_in_page/view_model/sign_in_view_model.dart';
import 'package:twitch_design/product/const/color_data.dart';
import 'package:twitch_design/product/const/string_data.dart';
import 'package:twitch_design/product/widgets/custom_text_field.dart';
import 'package:twitch_design/product/widgets/general_button.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends SignInViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const ProjectPaddings.largeAll(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringData.signIn,
                  style: context.textTheme.titleMedium,
                ),
                Padding(
                  padding: const ProjectPaddings.smallTopBigBottom(),
                  child: Text(
                    StringData.signInToContinue,
                    style: context.textTheme.bodySmall,
                  ),
                ),
                TextFieldWithLabel(
                  controller: emailController,
                  label: Text(
                    StringData.email,
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  icon: const Icon(Icons.email_outlined, color: Colors.black),
                  textStyle: context.textTheme.bodySmall?.copyWith(
                    fontSize: 16,
                  ),
                  onChanged: (String value) {
                    print(value);
                  },
                ),
                Padding(
                  padding: const ProjectPaddings.largeVertical(),
                  child: TextFieldWithLabel(
                    controller: passwordController,
                    label: Text(
                      StringData.password,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    icon: const Icon(Icons.password_outlined,
                        color: Colors.black),
                    suffix: IconButton(
                      onPressed: () {
                        changePasswordVisibility();
                      },
                      icon: Icon(
                        isVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.black,
                      ),
                    ),
                    isSecure: !isVisible,
                    textStyle: context.textTheme.bodySmall?.copyWith(
                      fontSize: 16,
                    ),
                    onChanged: (String value) {
                      print(value);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RememberRow(onChanged: (value) {
                      print(value);
                    }),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        StringData.forgotPassword,
                        style:
                            context.textTheme.bodySmall?.copyWith(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const ProjectPaddings.largeVertical() * 2,
                  child: GeneralButton(
                    text: Text(
                      'Sign In',
                      style: context.textTheme.bodyMedium,
                    ),
                    onPressed: () {},
                    backgroundColor: ColorData.purplishBlue,
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: _RegisterText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RememberRow extends StatefulWidget {
  const RememberRow({Key? key, required this.onChanged}) : super(key: key);

  final void Function(bool value) onChanged;

  @override
  State<RememberRow> createState() => _RememberRowState();
}

class _RememberRowState extends State<RememberRow> {
  bool rememberMe = false;

  changeRememberMe() {
    setState(() {
      rememberMe = !rememberMe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            changeRememberMe();
            widget.onChanged.call(rememberMe);
          },
          child: Ink(
            width: context.dynamicWidth(0.05),
            height: context.dynamicWidth(0.05),
            decoration: BoxDecoration(
              borderRadius: const ProjectBorders.oneAll(),
              border: Border.all(color: const Color(0xffbdbdbd), width: 1),
            ),
            child: rememberMe
                ? Icon(Icons.close, size: context.dynamicWidth(0.04))
                : null,
          ),
        ),
        Padding(
          padding: const ProjectPaddings.smallHorizontal(),
          child: Text(
            StringData.rememberMe,
            style: context.textTheme.bodySmall?.copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }
}

class _RegisterText extends StatelessWidget {
  const _RegisterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: StringData.dontHaveAccount,
        style: context.textTheme.bodySmall?.copyWith(fontSize: 16),
        children: [
          TextSpan(
            text: StringData.registerHere,
            recognizer: TapGestureRecognizer()..onTap = () {},
            style: context.textTheme.bodySmall?.copyWith(
                fontSize: 16,
                color: ColorData.butterflyBush,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
