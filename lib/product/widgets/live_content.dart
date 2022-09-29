import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:twitch_design/core/const/borders.dart';
import 'package:twitch_design/core/const/paddings.dart';
import 'package:twitch_design/product/const/color_data.dart';
import 'package:twitch_design/product/model/live_content_model.dart';

class LiveContentListView extends StatelessWidget {
  const LiveContentListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.4),
      child: ListView.separated(
        itemCount: LiveContentModel.dummyLiveContentList.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => Padding(
          padding: ProjectPaddings.smallHorizontal(),
        ),
        itemBuilder: (context, index) => LiveContent(
          model: LiveContentModel.dummyLiveContentList[index],
        ),
      ),
    );
  }
}

class LiveContent extends StatelessWidget {
  const LiveContent({
    Key? key,
    required this.model,
  }) : super(key: key);

  final LiveContentModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.75),
      child: Column(
        children: [
          _ContentImage(image: model.contentImage),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              StreamDescription(
                streamerName: model.streamerName,
                streamerImage: model.streamerImage,
                streamDescription: model.streamDescription,
              ),
              SizedBox(
                height: context.dynamicHeight(0.04),
                child: ListView.separated(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: model.contentCategoryList.length,
                  separatorBuilder: (context, index) => const Padding(
                    padding: ProjectPaddings.smallHorizontal(),
                  ),
                  itemBuilder: (context, index) => SmallCategoryContainer(
                    text: model.contentCategoryList[index].name,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContentImage extends StatelessWidget {
  const _ContentImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: context.dynamicHeight(0.25),
      fit: BoxFit.cover,
      width: context.dynamicWidth(0.75),
    );
  }
}

class StreamDescription extends StatelessWidget {
  const StreamDescription({
    Key? key,
    required this.streamerImage,
    required this.streamerName,
    required this.streamDescription,
  }) : super(key: key);

  final String streamerImage, streamerName, streamDescription;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          streamerImage,
        ),
      ),
      title: Text(
        streamerName,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: context.textTheme.headlineLarge?.copyWith(fontSize: 18),
      ),
      subtitle: Text(
        streamDescription,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        maxLines: 2,
        style: context.textTheme.headlineSmall?.copyWith(fontSize: 14),
      ),
    );
  }
}

class SmallCategoryContainer extends StatelessWidget {
  const SmallCategoryContainer({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: context.dynamicWidth(0.15),
        height: context.dynamicHeight(0.04),
        decoration: const BoxDecoration(
          borderRadius: ProjectBorders.mediumAll(),
          color: ColorData.mercury,
        ),
        child: Center(
          child: Text(
            text,
            style: context.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
