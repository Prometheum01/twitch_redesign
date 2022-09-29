import 'package:flutter/material.dart';

class ProjectPaddings extends EdgeInsets {
  const ProjectPaddings.smallAll() : super.all(8);

  const ProjectPaddings.smallVertical() : super.symmetric(vertical: 8);

  const ProjectPaddings.smallHorizontal() : super.symmetric(horizontal: 8);

  const ProjectPaddings.mediumAll() : super.all(12);

  const ProjectPaddings.mediumVertical() : super.symmetric(vertical: 12);

  const ProjectPaddings.mediumHorizontal() : super.symmetric(horizontal: 12);

  const ProjectPaddings.largeAll() : super.all(24);

  const ProjectPaddings.largeVertical() : super.symmetric(vertical: 24);

  const ProjectPaddings.largeHorizontal() : super.symmetric(horizontal: 24);

  const ProjectPaddings.customTextField()
      : super.symmetric(horizontal: 16, vertical: 8);
  const ProjectPaddings.smallTopBigBottom() : super.only(top: 8, bottom: 48);

  ProjectPaddings.smallestVerticalLargeHorizontal()
      : super.symmetric(
            vertical: const ProjectPaddings.smallVertical().vertical / 2,
            horizontal: const ProjectPaddings.largeHorizontal().horizontal);
}
