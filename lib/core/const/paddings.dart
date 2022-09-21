import 'package:flutter/material.dart';

class ProjectPaddings extends EdgeInsets {
  const ProjectPaddings.mediumAll() : super.all(12);

  const ProjectPaddings.mediumVertical() : super.symmetric(vertical: 12);

  const ProjectPaddings.mediumHorizontal() : super.symmetric(horizontal: 12);

  const ProjectPaddings.largeAll() : super.all(24);

  const ProjectPaddings.largeVertical() : super.symmetric(vertical: 24);

  const ProjectPaddings.largeHorizontal() : super.symmetric(horizontal: 24);
}
