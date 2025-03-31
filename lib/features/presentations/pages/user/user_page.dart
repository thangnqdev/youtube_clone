import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube/core/constants/assets/app_vectors.dart';
import 'package:youtube/features/domain/entities/item_config_user.dart';
import 'package:youtube/features/presentations/bloc/is_dark_mode.dart';
import 'package:youtube/features/presentations/pages/home/pages/home_page.dart';
import 'package:youtube/features/presentations/pages/sign_in_demo.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemConfigUser> itemsConfig = <ItemConfigUser>[
      ItemConfigUser(
        SvgPicture.asset(
          context.isDarkMode
              ? AppVectors.personOutlineDarkMode
              : AppVectors.personOutlineLightMode,
        ),
        'Your Channel',
      ),
      ItemConfigUser(
        SvgPicture.asset(
          context.isDarkMode
              ? AppVectors.settingStudioDarkMode
              : AppVectors.settingStudioLightMode,
        ),
        'YouTube Studio',
      ),
      ItemConfigUser(
        SvgPicture.asset(
          context.isDarkMode
              ? AppVectors.barCharDarkMode
              : AppVectors.barCharLightMode,
        ),
        'Time watched',
      ),
      ItemConfigUser(
        SvgPicture.asset(
          context.isDarkMode
              ? AppVectors.playButtonDarkMode
              : AppVectors.playButtonLightMode,
        ),
        'Get YouTube Premium',
      ),
      ItemConfigUser(
        SvgPicture.asset(
          context.isDarkMode
              ? AppVectors.attachMoneyDarkMode
              : AppVectors.attachMoneyLightMode,
        ),
        'Purchases and memberships',
      ),
      ItemConfigUser(
        SvgPicture.asset(
          context.isDarkMode
              ? AppVectors.videoLibraryDarkMode
              : AppVectors.videoLibraryLightMode,
        ),
        'Switch account',
      ),
      ItemConfigUser(
        SvgPicture.asset(
          context.isDarkMode
              ? AppVectors.incognitoDarkMode
              : AppVectors.incognitoLightMode,
        ),
        'Turn on Incognito',
      ),
      ItemConfigUser(
        SvgPicture.asset(
          context.isDarkMode
              ? AppVectors.verifiedUserDarkMode
              : AppVectors.verifiedUserLightMode,
        ),
        'Your data in YouTube',
      ),
      ItemConfigUser(
        SvgPicture.asset(
          context.isDarkMode
              ? AppVectors.settingsDarkMode
              : AppVectors.settingsLightMode,
        ),
        'Settings',
      ),
      ItemConfigUser(
        SvgPicture.asset(
          context.isDarkMode
              ? AppVectors.helpOutlineDarkMode
              : AppVectors.helpOutlineLightMode,
        ),
        'Help and feedback',
      ),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            buildAppBar(context),
            buildTopBody(context),
            buildBody(context, itemsConfig),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.primary,
      leading: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInDemo()),
            ),
        child: Icon(Icons.arrow_back_ios_new),
      ),
      title: Text('Account', style: TextStyle(color: AppColors.news)),
      centerTitle: true,
    );
  }

  Widget buildTopBody(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 2, 0, 4),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0XFFE5E5E5), width: 1),
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(Icons.account_circle),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('username'),
                    Text('gmail'),
                    Text(
                      'Manage Your Google Account',
                      style: TextStyle(color: AppColors.news),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, List<ItemConfigUser> items) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        if (index == 1) {
          return itemYoutubeStudio(context, items[index]);
        }else{
          return itemConfigLayout(context, items[index]);

        }
      },
      itemCount: items.length,
    );
  }

  Widget itemConfigLayout(BuildContext context, ItemConfigUser item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(18, 13, 18, 13),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [item.iconStart, SizedBox(width: 27), Text(item.title)],
        ),
      ),
    );
  }

  Widget itemYoutubeStudio(BuildContext context, ItemConfigUser item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(18, 13, 18, 13),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            item.iconStart,
            SizedBox(width: 27),
            Text(item.title),
            Spacer(),
            SvgPicture.asset(
              context.isDarkMode
                  ? AppVectors.launchDarkMode
                  : AppVectors.launchLightMode,
            ),
          ],
        ),
      ),
    );
  }
}
