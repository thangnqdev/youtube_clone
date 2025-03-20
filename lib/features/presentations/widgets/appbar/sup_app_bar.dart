import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube/core/constants/assets/app_vectors.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class SupAppBar extends StatelessWidget {
  const SupAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final item = [
      "Short",
      "All",
      "UI Design",
      "UX Design",
      "UI Design",
      "UX Design",
    ];
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                margin: EdgeInsets.only(right: 4.0),
                width: 100,
                height: 34,
                padding: EdgeInsets.fromLTRB(13, 8, 13, 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.primary,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppVectors.youtubeShorts,
                      height: 24,
                      width: 20,
                    ),
                    SizedBox(width: 8),
                    Text('Short', style: TextStyle(fontSize: 15)),
                  ],
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                height: 34,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary,
                ),
                padding: EdgeInsets.fromLTRB(13, 8, 13, 8),
                child: Text(item[index], style: TextStyle(fontSize: 15)),
              );
            }
          },
          itemCount: item.length,
        ),
      ),
    );
  }
}
