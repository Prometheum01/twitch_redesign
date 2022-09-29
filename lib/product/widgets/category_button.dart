import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:twitch_design/core/const/paddings.dart';
import 'package:twitch_design/features/select_category_page/provider/category_provider.dart';
import 'package:twitch_design/product/const/color_data.dart';
import 'package:twitch_design/product/model/category_model.dart';
import 'package:twitch_design/product/widgets/custom_text_field.dart';

import '../../core/const/borders.dart';

class CategoryButtonWithIcon extends StatelessWidget {
  const CategoryButtonWithIcon({
    Key? key,
    required this.categoryText,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String categoryText;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      borderRadius: const ProjectBorders.smallAll(),
      child: Ink(
        height: context.dynamicHeight(0.075),
        decoration: const BoxDecoration(
          borderRadius: ProjectBorders.smallAll(),
          color: Color(0xff6711fe),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              categoryText,
              style: context.textTheme.headlineLarge?.copyWith(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 36,
            )
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatefulWidget {
  const CategoryButton({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CategoryModel model;

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CategoryProvider>().pressCats(widget.model);
      },
      child: _CategoryContainer(widget: widget),
    );
  }
}

class _CategoryContainer extends StatelessWidget {
  const _CategoryContainer({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final CategoryButton widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: TextFieldContainerDecoration().copyWith(
        color: context
                .watch<CategoryProvider>()
                .selectedCats
                .contains(widget.model)
            ? ColorData.softPeach
            : null,
      ),
      child: Padding(
        padding: const ProjectPaddings.smallAll(),
        child: Center(
          child: Text(
            widget.model.name,
            style: context.textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
