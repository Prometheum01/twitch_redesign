import 'package:flutter/material.dart';
import 'package:twitch_design/product/const/image_paths.dart';

class GameDetailPageView extends StatefulWidget {
  const GameDetailPageView({super.key, required this.tag});

  final String tag;

  @override
  State<GameDetailPageView> createState() => _GameDetailPageViewState();
}

class _GameDetailPageViewState extends State<GameDetailPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.tag,
        child: Image.asset(
          ImagePaths.codWarzone,
          width: 300,
          height: 500,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
