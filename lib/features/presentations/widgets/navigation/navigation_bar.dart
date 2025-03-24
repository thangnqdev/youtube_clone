import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube/core/constants/assets/app_vectors.dart';
import 'package:youtube/features/presentations/bloc/is_dark_mode.dart';

class BaseNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  const BaseNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
  });
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      backgroundColor: backgroundColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: context.isDarkMode ? Colors.white :Colors.black,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            context.isDarkMode
                ? AppVectors.homeDarkMode
                : AppVectors.homeLightMode,
          ),    
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            context.isDarkMode    
                ? AppVectors.exploreDarkMode
                : AppVectors.exploreLightMode,
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(top: 15),
            child: SvgPicture.asset(
              context.isDarkMode
                  ? AppVectors.addDarkMode
                  : AppVectors.addLightMode,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            context.isDarkMode
                ? AppVectors.subscriptionDarkMode
                : AppVectors.subscriptionLightMode,
          ),
          label: 'Subscription',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            context.isDarkMode
                ? AppVectors.libraryDarkMode
                : AppVectors.libraryLightMode,
          ),
          label: 'Library',
        ),
      ],
    );
  }
}
