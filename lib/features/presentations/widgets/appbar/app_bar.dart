import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube/core/constants/assets/app_images.dart';
import 'package:youtube/core/constants/assets/app_vectors.dart';
import 'package:youtube/features/presentations/bloc/is_dark_mode.dart';
import 'package:youtube/features/presentations/pages/user/user_page.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor:
          context.isDarkMode
              ? AppColors.backgroundDarkMode
              : AppColors.backgroundLightMode,
      leadingWidth: 90,
      leading: Image.asset(
        context.isDarkMode ? AppImages.logoDarkMode : AppImages.logoLightMode,
        fit: BoxFit.contain,
      ),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  context.isDarkMode
                      ? AppVectors.castDarkMode
                      : AppVectors.castLightMode,
                  width: 28,
                  height: 28,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  context.isDarkMode
                      ? AppVectors.notificationDarkMode
                      : AppVectors.notificationLightMode,
                  width: 28,
                  height: 28,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  context.isDarkMode
                      ? AppVectors.searchDarkMode
                      : AppVectors.searchLightMode,
                  width: 28,
                  height: 28,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage()));
                },
                icon: Icon(Icons.account_circle_rounded),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
