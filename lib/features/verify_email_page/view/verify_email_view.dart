import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:twitch_design/core/const/paddings.dart';
import 'package:twitch_design/product/const/color_data.dart';
import 'package:twitch_design/product/const/image_paths.dart';
import 'package:twitch_design/product/const/string_data.dart';
import 'package:kartal/kartal.dart';

import '../../main_page/view/main_page_view.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const ProjectPaddings.largeAll(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                StringData.verifyEmail,
                style: context.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              Lottie.asset(
                ImagePaths.verifyEmailLottie,
                height: context.dynamicHeight(0.5),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: ProjectPaddings.largeHorizontal(),
                child: _EmailSendMessage(),
              ),
              Padding(
                padding: const ProjectPaddings.largeVertical(),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MainPageView(),
                      ),
                    );
                  },
                  child: Text(
                    StringData.backToLogin,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: ColorData.purplishBlue,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class _EmailSendMessage extends StatelessWidget {
  const _EmailSendMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
              style: context.textTheme.bodySmall,
              text: '${StringData.firstEmailVerify}\n'),
          TextSpan(
              style: context.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.w700),
              text: "Example@mail.com\n"),
          TextSpan(
            style: context.textTheme.bodySmall,
            text: StringData.secondEmailVerify,
          )
        ],
      ),
    );
  }
}
