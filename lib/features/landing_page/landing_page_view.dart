import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:twitch_design/core/const/paddings.dart';
import 'package:twitch_design/product/const/color_data.dart';
import 'package:twitch_design/product/const/image_paths.dart';
import 'package:twitch_design/product/const/string_data.dart';
import 'package:twitch_design/product/widgets/general_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: context.dynamicWidth(0.35),
              top: context.dynamicWidth(0.33),
              child: Image.asset(
                ImagePaths.twitchLogo,
                width: context.dynamicWidth(0.3),
                height: context.dynamicWidth(0.3),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: context.dynamicWidth(0.33 + 0.3 + 0.3),
              child: const WelcomeColumn(),
            ),
          ],
        ),
        backgroundColor: ColorData.purplishBlue);
  }
}

class WelcomeColumn extends StatelessWidget {
  const WelcomeColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          StringData.welcome,
          style: context.textTheme.titleLarge,
        ),
        const Padding(padding: ProjectPaddings.mediumVertical()),
        Text(
          StringData.toTwitchStreaming,
          style: context.textTheme.titleLarge,
        ),
        Padding(
          padding: const ProjectPaddings.largeAll() * 2,
          child: GeneralButton(
              text: Text(
                StringData.getStarted,
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: ColorData.fuchsiaBlue),
              ),
              onPressed: () {}),
        ),
      ],
    );
  }
}
