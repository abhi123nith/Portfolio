// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/views/about_me.dart';
import 'package:portfolio/views/contact_us.dart';
import 'package:portfolio/views/footer_class.dart';
import 'package:portfolio/views/home_page.dart';
import 'package:portfolio/views/my_portfolio.dart';
import 'package:portfolio/views/skills.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({super.key});

  @override
  _MainDashBoardState createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  final List<String> menuItems = [
    'Home',
    'About',
    'Skills',
    'Projects',
    'Contact',
  ];

  int menuIndex = 0;

  final List<Widget> screensList = [
    const HomePage(),
    const AboutMe(),
    MySkills(),
    const MyPortfolio(),
     ContactUs(),
    const FooterClass(),
  ];

  Future<void> scrollTo(int index) async {
    if (index < 0 || index >= screensList.length) {
      return; // Ensure index is within bounds
    }
    try {
      await _itemScrollController.scrollTo(
        index: index,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
      setState(() {
        menuIndex = index;
      });
    } catch (e) {
      print('Scroll error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        toolbarHeight: 90,
        titleSpacing: 40,
        elevation: 0,
        title: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 768;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('Portfolio'),
                const Spacer(),
                if (isMobile) ...[
                  PopupMenuButton(
                    icon: Icon(
                      Icons.menu_sharp,
                      size: 32,
                      color: AppColors.white,
                    ),
                    color: AppColors.bgColor2,
                    constraints:
                        BoxConstraints.tightFor(width: size.width * 0.9),
                    itemBuilder: (context) => menuItems
                        .asMap()
                        .entries
                        .map(
                          (e) => PopupMenuItem(
                            textStyle: AppTextStyles.headerTextStyle(),
                            onTap: () => scrollTo(e.key),
                            child: Text(e.value),
                          ),
                        )
                        .toList(),
                  ),
                ] else ...[
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      itemCount: menuItems.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          Constants.sizedBox(width: 8),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => scrollTo(index),
                          borderRadius: BorderRadius.circular(100),
                          onHover: (value) {
                            setState(() {
                              menuIndex = value ? index : 0;
                            });
                          },
                          child: buildNavBarAnimatedContainer(
                              index, menuIndex == index),
                        );
                      },
                    ),
                  ),
                  Constants.sizedBox(width: 30),
                ],
              ],
            );
          },
        ),
      ),
      body: ScrollablePositionedList.builder(
        itemCount: screensList.length,
        itemScrollController: _itemScrollController,
        itemPositionsListener: _itemPositionsListener,
        itemBuilder: (context, index) {
          return screensList[index];
        },
      ),
    );
  }

  AnimatedContainer buildNavBarAnimatedContainer(int index, bool hover) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: hover ? 80 : 75,
      duration: const Duration(milliseconds: 200),
      child: Text(
        menuItems[index],
        style: AppTextStyles.headerTextStyle(
          color: hover ? AppColors.themeColor : AppColors.white,
        ),
      ),
    );
  }
}
