import 'package:flutter/material.dart';
import 'package:twitch_design/core/const/borders.dart';
import 'package:twitch_design/core/const/paddings.dart';

class GeneralButton extends InkWell {
  GeneralButton({
    Key? key,
    required Text text,
    Color backgroundColor = Colors.white,
    required Function onPressed,
  }) : super(
          key: key,
          onTap: () {
            onPressed();
          },
          borderRadius: const ProjectBorders.mediumAll(),
          child: Ink(
            width: double.infinity,
            decoration: ButtonDecoration(backgroundColor: backgroundColor),
            child: Padding(
              padding: const ProjectPaddings.mediumAll(),
              child: Center(
                child: text,
              ),
            ),
          ),
        );
}

class ButtonDecoration extends BoxDecoration {
  const ButtonDecoration({Color backgroundColor = Colors.white})
      : super(
            color: backgroundColor,
            borderRadius: const ProjectBorders.mediumAll());
}
