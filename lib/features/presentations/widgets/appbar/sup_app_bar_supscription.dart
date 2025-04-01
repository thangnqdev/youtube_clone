import 'package:flutter/material.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class SupAppBarSupscription extends StatelessWidget {
  const SupAppBarSupscription({super.key});

  @override
  Widget build(BuildContext context) {
    final item = [
      "All",
      "Today",
      "Continute Watching",
      "Unwatched",
      "UI Unwatched",
      "Continute Watching",
    ];
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              height: 34,
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary,
              ),
              padding: EdgeInsets.fromLTRB(13, 8, 13, 8),
              child: Text(item[index], style: TextStyle(fontSize: 15)),
            );
          },
          itemCount: item.length,
        ),
      ),
    );
  }
}
