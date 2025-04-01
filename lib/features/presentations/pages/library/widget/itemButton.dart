import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube/features/presentations/bloc/is_dark_mode.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class Itembutton extends StatelessWidget {
  final String vectorDark;
  final String vectorLight;
  final String textButton;
  const Itembutton({
    super.key,
    required this.textButton,
    required this.vectorDark,
    required this.vectorLight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13.0),
      width: MediaQuery.of(context).size.width / 2.2,
      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        children: [
          SvgPicture.asset(context.isDarkMode ? vectorDark : vectorLight),
          SizedBox(width: 13),
          Text(textButton),
        ],
      ),
    );
  }
}
