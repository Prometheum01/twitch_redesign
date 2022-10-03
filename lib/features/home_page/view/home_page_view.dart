import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:twitch_design/core/const/paddings.dart';
import 'package:twitch_design/product/const/color_data.dart';
import 'package:twitch_design/product/const/dummy_lists.dart';
import 'package:twitch_design/product/const/image_paths.dart';
import 'package:twitch_design/product/const/string_data.dart';
import 'package:twitch_design/product/model/category_model.dart';
import 'package:twitch_design/product/model/game_model.dart';

import '../../../product/widgets/category_button.dart';
import '../../../product/widgets/live_content.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _HomePageAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const ProjectPaddings.largeHorizontal() +
              const ProjectPaddings.mediumVertical(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringData.recommendedLiveChannels,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontSize: 22,
                ),
              ),
              const Padding(
                padding: ProjectPaddings.smallVertical(),
                child: LiveContentListView(),
              ),
              const _CategoryAndMoreRow(),
              const CategoryButtonWithIconGrid(),
              const Padding(
                padding: ProjectPaddings.mediumVertical(),
                child: _PopularCategoriesText(),
              ),
              SizedBox(
                height: context.dynamicHeight(0.3),
                child: ListView.separated(
                  itemCount: DummyGameList.dummyList.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, _) =>
                      const Padding(padding: ProjectPaddings.smallHorizontal()),
                  itemBuilder: (context, index) => PopularCategoryWidget(
                    tag: GameModel.dummyGameModelList[index].id,
                    image: DummyGameList.dummyList[index],
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  AppBar _HomePageAppBar() {
    return AppBar(
      leadingWidth: context.dynamicWidth(0.25),
      leading: Padding(
        padding: const ProjectPaddings.smallHorizontal(),
        child: Image.asset(ImagePaths.twitchTextLogo),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          splashRadius: 24,
          icon: const Icon(
            Icons.search_outlined,
            size: 32,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class PopularCategoryWidget extends StatelessWidget {
  const PopularCategoryWidget({
    Key? key,
    required this.image,
    required this.onPressed,
    required this.tag,
  }) : super(key: key);

  final String image;
  final Function onPressed;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Hero(
        tag: tag,
        child: Image.asset(
          image,
          height: context.dynamicHeight(0.3),
          width: context.dynamicWidth(0.4),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CategoryButtonWithIconGrid extends StatelessWidget {
  const CategoryButtonWithIconGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.075) * 2 +
          const ProjectPaddings.smallVertical().vertical,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: context.dynamicHeight(0.075),
          mainAxisSpacing: const ProjectPaddings.smallVertical().vertical,
          crossAxisSpacing: const ProjectPaddings.smallHorizontal().horizontal,
        ),
        //physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) => CategoryButtonWithIcon(
          categoryText: CategoryModel.dummyList[index].name,
          icon: Icons.music_note_outlined,
          onPressed: () {},
        ),
      ),
    );
  }
}

class _CategoryAndMoreRow extends StatelessWidget {
  const _CategoryAndMoreRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringData.category,
          style: context.textTheme.headlineLarge?.copyWith(fontSize: 22),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            StringData.more,
            style: context.textTheme.headlineSmall?.copyWith(
              fontSize: 18,
              color: ColorData.purplishBlue,
            ),
          ),
        ),
      ],
    );
  }
}

class _PopularCategoriesText extends StatelessWidget {
  const _PopularCategoriesText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: StringData.popularCategoriesFirst,
        style: context.textTheme.headlineLarge?.copyWith(
          fontSize: 22,
        ),
        children: [
          TextSpan(
            text: ' ${StringData.popularCategoriesSecond}',
            style: context.textTheme.headlineLarge?.copyWith(
              fontSize: 22,
              color: ColorData.purplishBlue,
            ),
          ),
        ],
      ),
    );
  }
}
