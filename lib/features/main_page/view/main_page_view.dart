import 'package:flutter/material.dart';
import 'package:twitch_design/features/main_page/view_model/main_page_view_model.dart';
import 'package:twitch_design/product/const/color_data.dart';
import 'package:twitch_design/product/const/string_data.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends MainPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorData.purplishBlue,
        child: const Icon(
          Icons.video_camera_front_outlined,
        ),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: pageList.length,
        itemBuilder: (context, index) {
          return pageList[index];
        },
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: pageIndex,
      onTap: (int index) {
        changePageIndex(index);
      },
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.black,
      selectedItemColor: ColorData.purplishBlue,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              pageIndex == 0 ? Icons.explore_rounded : Icons.explore_outlined,
            ),
            label: StringData.discoverLabel),
        BottomNavigationBarItem(
            icon: Icon(
              pageIndex == 1
                  ? Icons.notifications_rounded
                  : Icons.notifications_outlined,
            ),
            label: StringData.notificationLabel),
        BottomNavigationBarItem(
            icon: Icon(
              pageIndex == 2 ? Icons.message_rounded : Icons.message_outlined,
            ),
            label: StringData.chatLabel),
        BottomNavigationBarItem(
            icon: Icon(
              pageIndex == 3 ? Icons.person_rounded : Icons.person_outlined,
            ),
            label: StringData.profileLabel),
      ],
    );
  }
}
