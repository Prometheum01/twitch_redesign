import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:twitch_design/core/const/paddings.dart';

class TitleWithSub extends StatelessWidget {
  const TitleWithSub({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleMedium,
        ),
        Padding(
          padding: const ProjectPaddings.smallTopBigBottom(),
          child: Text(
            subtitle,
            style: context.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
