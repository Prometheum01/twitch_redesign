import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:twitch_design/core/const/paddings.dart';
import 'package:twitch_design/features/select_category_page/view_model/select_category_view_model.dart';
import 'package:twitch_design/features/welcome_page/view/welcome_page.dart';
import 'package:twitch_design/product/const/color_data.dart';
import 'package:twitch_design/product/const/string_data.dart';
import 'package:twitch_design/product/widgets/category_grid_view.dart';
import 'package:twitch_design/product/widgets/general_button.dart';
import 'package:twitch_design/product/widgets/title_with_sub.dart';

class SelectCategoryView extends StatefulWidget {
  const SelectCategoryView({Key? key}) : super(key: key);

  @override
  State<SelectCategoryView> createState() => _SelectCategoryViewState();
}

class _SelectCategoryViewState extends SelectCategoryViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const ProjectPaddings.largeAll(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TitleWithSub(
                title: StringData.selectCategory,
                subtitle: StringData.chooseGame,
              ),
              CategoryGridView(),
              _ImReadyButton(),
              _SkipButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ),
          );
        },
        child: Text(
          StringData.skip,
          style: context.textTheme.bodySmall?.copyWith(
            color: ColorData.osloGrey,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _ImReadyButton extends StatelessWidget {
  const _ImReadyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPaddings.largeVertical(),
      child: GeneralButton(
        text: Text(
          StringData.imReady,
          style: context.textTheme.bodyMedium,
        ),
        backgroundColor: ColorData.purplishBlue,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ),
          );
        },
      ),
    );
  }
}
