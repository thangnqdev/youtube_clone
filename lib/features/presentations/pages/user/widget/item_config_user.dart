import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube/core/constants/assets/app_vectors.dart';
import 'package:youtube/features/domain/entities/item_config_user.dart';

List<ItemConfigUser> getItemsConfig(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return [
    ItemConfigUser(
      SvgPicture.asset(isDark
          ? AppVectors.personOutlineDarkMode
          : AppVectors.personOutlineLightMode),
      'Your Channel',
    ),
    ItemConfigUser(
      SvgPicture.asset(isDark
          ? AppVectors.settingStudioDarkMode
          : AppVectors.settingStudioLightMode),
      'YouTube Studio',
    ),
    ItemConfigUser(
      SvgPicture.asset(isDark
          ? AppVectors.barCharDarkMode
          : AppVectors.barCharLightMode),
      'Time watched',
    ),
    ItemConfigUser(
      SvgPicture.asset(isDark
          ? AppVectors.playButtonDarkMode
          : AppVectors.playButtonLightMode),
      'Get YouTube Premium',
    ),
    ItemConfigUser(
      SvgPicture.asset(isDark
          ? AppVectors.attachMoneyDarkMode
          : AppVectors.attachMoneyLightMode),
      'Purchases and memberships',
    ),
    ItemConfigUser(
      SvgPicture.asset(isDark
          ? AppVectors.videoLibraryDarkMode
          : AppVectors.videoLibraryLightMode),
      'Switch account',
    ),
    ItemConfigUser(
      SvgPicture.asset(isDark
          ? AppVectors.incognitoDarkMode
          : AppVectors.incognitoLightMode),
      'Turn on Incognito',
    ),
    ItemConfigUser(
      SvgPicture.asset(isDark
          ? AppVectors.verifiedUserDarkMode
          : AppVectors.verifiedUserLightMode),
      'Your data in YouTube',
    ),
    ItemConfigUser(
      SvgPicture.asset(isDark
          ? AppVectors.settingsDarkMode
          : AppVectors.settingsLightMode),
      'Settings',
    ),
    ItemConfigUser(
      SvgPicture.asset(isDark
          ? AppVectors.helpOutlineDarkMode
          : AppVectors.helpOutlineLightMode),
      'Help and feedback',
    ),
    ItemConfigUser(
      SvgPicture.asset(AppVectors.icLogOut),
      'Log out',
    ),
  ];
}
