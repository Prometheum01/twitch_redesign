import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:twitch_design/core/const/paddings.dart';
import 'package:twitch_design/features/main_page/view/main_page_view.dart';
import 'package:twitch_design/product/const/color_data.dart';
import 'package:twitch_design/product/const/image_paths.dart';
import 'package:twitch_design/product/const/string_data.dart';
import 'package:twitch_design/product/widgets/general_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const ProjectPaddings.largeAll(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringData.welcomeToTwitch.toUpperCase(),
                  style: context.textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const ProjectPaddings.largeVertical() * 2,
                  child: Lottie.asset(ImagePaths.welcomeLottie),
                ),
                GeneralButton(
                  text: Text(
                    StringData.liveStreamNow,
                    style: context.textTheme.bodyMedium,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MainPageView(),
                      ),
                    );
                  },
                  backgroundColor: ColorData.purplishBlue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
