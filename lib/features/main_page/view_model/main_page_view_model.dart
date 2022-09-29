import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:twitch_design/features/chat_page/view/chat_page_view.dart';
import 'package:twitch_design/features/home_page/view/home_page_view.dart';
import 'package:twitch_design/features/notification_page/view/notification_page_view.dart';
import 'package:twitch_design/features/profile_page/view/profile_page_view.dart';

import '../view/main_page_view.dart';

abstract class MainPageViewModel extends State<MainPageView> {
  int pageIndex = 0;

  PageController pageController = PageController();

  final List<Widget> pageList = const [
    HomePageView(),
    NotificationPageView(),
    ChatPageView(),
    ProfilePageView(),
  ];

  changePageIndex(int newIndex) {
    setState(
      () {
        pageIndex = newIndex;
        pageController.animateToPage(newIndex,
            duration: context.durationLow, curve: Curves.ease);
      },
    );
  }
}
