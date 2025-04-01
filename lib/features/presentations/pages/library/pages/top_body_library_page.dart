import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/features/domain/entities/info_video.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_bloc.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_event.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_state.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class TopBodyLibraryPage extends StatefulWidget {
  const TopBodyLibraryPage({super.key});

  @override
  State<TopBodyLibraryPage> createState() => _TopBodyLibraryPageState();
}

class _TopBodyLibraryPageState extends State<TopBodyLibraryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ListVideoBloc>().add(FetchVideoYoutubeInfo());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListVideoBloc, ListVideoState>(
      builder: (context, state) {
        if (state is ListVideoLoading) {
          return SliverToBoxAdapter(child: CircularProgressIndicator());
        } else if (state is ListVideoSuccess) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final video = state.videos[index];
                  return itemVideoLibrary(context, video);
                },
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(child: Text('errors'));
        }
      },
    );
  }

  Widget itemVideoLibrary(BuildContext context, InfoVideo video) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(video.thumbnailUrl, width: 140, height: 80),
          SizedBox(
            width: 122,
            child: Text(
              video.videoTitle,
              style: TextStyle(fontSize: 10),
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            video.channelTitle,
            style: TextStyle(fontSize: 8, color: AppColors.subText),
          ),
        ],
      ),
    );
  }
}
