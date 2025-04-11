import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/features/domain/entities/info_video_trending.dart';
import 'package:youtube/features/presentations/pages/explore/pages/bloc/list_video_trending_bloc.dart';
import 'package:youtube/features/presentations/pages/explore/pages/bloc/list_video_trending_event.dart';
import 'package:youtube/features/presentations/pages/explore/pages/bloc/list_video_trending_state.dart';
import 'package:youtube/features/presentations/widgets/item/item_video.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class BodyExplorePage extends StatefulWidget {
  final Function(String) callBack;
  const BodyExplorePage({super.key, required this.callBack});

  @override
  State<BodyExplorePage> createState() => _BodyExplorePageState();
}

class _BodyExplorePageState extends State<BodyExplorePage> {
  @override
  void initState() {
    super.initState();
    context.read<ListVideoTrendingBloc>().add(FetchVideoTrendingInfo());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListVideoTrendingBloc, ListVideoTrendingState>(
      builder: (context, state) {
        if (state is ListVideoTrendingLoading) {
          return SliverToBoxAdapter(
            child: Center(child: SizedBox(child: CircularProgressIndicator(color: AppColors.subText))),
          );
        } else if (state is ListVideoTrendingSuccess) {
          return SliverList.builder(
            itemBuilder: (context, index) {
              final video = state.videos[index];
              return GestureDetector(
                onTap: () {
                  widget.callBack(video.id);
                },
                child: itemVideoLayout(context, video),
              );
            },
            itemCount: state.videos.length,
          );
        } else if (state is ListVideoTrendingErrors) {
          return SliverToBoxAdapter(child: Text('Errors'));
        }
        return SliverToBoxAdapter(child: Text('something went wrong'));
      },
    );
  }

  Widget itemVideoLayout(BuildContext context, InfoVideoTrending video) {
    return ItemVideo(
      thumbnailUrl: video.thumbnailUrl,
      videoTitle: video.videoTitle,
      channelTitle: video.channelTitle,
      publishedAt: video.publishedAt,
      viewCount: video.viewCount,
      heightImg: 200,
      widthImg: double.infinity,
      sizeTitleChannel: 15,
      sizeTitleVideo: 12,
    );
  }
}
