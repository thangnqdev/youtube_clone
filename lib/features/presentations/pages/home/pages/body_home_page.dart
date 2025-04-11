import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/features/domain/entities/info_video.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_bloc.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_event.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_state.dart';
import 'package:youtube/features/presentations/widgets/item/item_video.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class BodyHomePage extends StatefulWidget {
  final Function(String) callBack;
  const BodyHomePage({super.key, required this.callBack});

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ListVideoBloc>().add(FetchVideoYoutubeInfo());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListVideoBloc, ListVideoState>(
      builder: (context, state) {
        if (state is ListVideoLoading) {
          return SliverToBoxAdapter(
            child: SizedBox(
              child: Center(
                child: SizedBox(
                  child: CircularProgressIndicator(color: AppColors.subText),
                ),
              ),
            ),
          );
        } else if (state is ListVideoSuccess) {
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
        } else if (state is ListVideoError) {
          return SliverToBoxAdapter(child: Text('Errors'));
        }
        return SliverToBoxAdapter(child: Text('something went wrong'));
      },
    );
  }

  Widget itemVideoLayout(BuildContext context, InfoVideo video) {
    return ItemVideo(
      thumbnailUrl: video.thumbnailUrl,
      videoTitle: video.videoTitle,
      channelTitle: video.channelTitle,
      publishedAt: video.publishedAt,
      viewCount: video.viewCount,
      widthImg: double.infinity,
      heightImg: 200,
      sizeTitleChannel: 12,
      sizeTitleVideo: 15,
    );
  }
}
