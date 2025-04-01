import 'package:flutter/material.dart';
import 'package:youtube/core/constants/assets/app_vectors.dart';
import 'package:youtube/features/presentations/pages/library/widget/itemButton.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class BodyLibraryPage extends StatelessWidget {
  const BodyLibraryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(
            height: 1,
            width: double.infinity,
            child: ColoredBox(color: AppColors.primary),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              btnHistory(context),
              btnYourVideos(context),
              btnDownload(context),
              btnYourMovies(context),
              btnWatchLater(context),
              btnLikedVideos(context),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text('PlayLists'),
              Spacer(),
              Text('A-Z'),
              Icon(Icons.arrow_drop_down_outlined)
            ],
          ),
          Container(
            padding: EdgeInsets.all(13.0),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(5.0)
            ),
            child: Row(
              children: [
                Icon(Icons.add, color: AppColors.news),
                SizedBox(width: 13),
                Text('New playlist', style: TextStyle(color: AppColors.news))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget btnHistory(BuildContext context) {
    return Itembutton(
      textButton: 'History',
      vectorDark: AppVectors.historyDarkMode,
      vectorLight: AppVectors.history,
    );
  }

  Widget btnYourVideos(BuildContext context) {
    return Itembutton(
      textButton: 'Your videos',
      vectorDark: AppVectors.videoLibraryDarkMode,
      vectorLight: AppVectors.videoLibraryLightMode,
    );
  }

  Widget btnDownload(BuildContext context) {
    return Itembutton(
      textButton: 'Downloads',
      vectorDark: AppVectors.downloadDarkMode,
      vectorLight: AppVectors.download,
    );
  }

  Widget btnYourMovies(BuildContext context) {
    return Itembutton(
      textButton: 'Your movies',
      vectorDark: AppVectors.moviesDarkMode,
      vectorLight: AppVectors.movies,
    );
  }

  Widget btnWatchLater(BuildContext context) {
    return Itembutton(
      textButton: 'Watch later',
      vectorDark: AppVectors.accessTimeDarkMode,
      vectorLight: AppVectors.accessTime,
    );
  }

  Widget btnLikedVideos(BuildContext context) {
    return Itembutton(
      textButton: 'Liked videos',
      vectorDark: AppVectors.likeDarkMode,
      vectorLight: AppVectors.like,
    );
  }
}
