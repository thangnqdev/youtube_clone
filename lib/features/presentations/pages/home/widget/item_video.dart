import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube/core/constants/assets/app_images.dart';
import 'package:youtube/core/constants/assets/app_vectors.dart';
import 'package:youtube/features/presentations/bloc/is_dark_mode.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class ItemVideo extends StatelessWidget {
  const ItemVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 266,
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(AppImages.imgDemo, width: double.infinity, height: 196),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 8),
                  Icon(Icons.account_circle_outlined),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Figma Tutorial : Device Frames and Scrolling',
                          style: TextStyle(fontSize: 15),
                          maxLines: 2,
                          softWrap: true,
                        ),
                        Text(
                          'Figma   90K views   1 months ago',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.subText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 25),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        context.isDarkMode
                            ? AppVectors.moreVertDarkMode
                            : AppVectors.moreVert,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
