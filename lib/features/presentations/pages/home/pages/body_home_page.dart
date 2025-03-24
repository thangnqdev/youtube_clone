import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_bloc.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_event.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_state.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({super.key});

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListVideoBloc, ListVideoState>(
      builder: (context, state) {
        if(state is ListVideoLoading){
          context.read<ListVideoBloc>().add(FetchVideoYoutubeInfo());
          return SliverToBoxAdapter(child: CircularProgressIndicator());
        }else if(state is ListVideoLoading){
          return SliverToBoxAdapter(child: CircularProgressIndicator());
        }else if (state is ListVideoSuccess){
          return SliverList.builder(itemBuilder: (context, index) {
            final video = state.videos[index];
            return Column(
              children: [
                Image.network(video.thumbnailUrl, fit: BoxFit.fill, height: 200, width: double.infinity),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8,16,8,0),
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:36, width: 36, child:Icon(Icons.account_circle_outlined)),
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(video.videoTitle, style: TextStyle(fontSize: 15), maxLines: 2, softWrap: true, overflow: TextOverflow.ellipsis,),
                              Row(
                                children: [
                                  Text(video.channelTitle, style: TextStyle(fontSize: 12, color: Color(0XFF606060))),
                                  Text(video.viewCount.toString(), style: TextStyle(fontSize: 12, color: Color(0XFF606060))),
                                  Text(video.publishedAt, style: TextStyle(fontSize: 12, color: Color(0XFF606060)))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          itemCount: state.videos.length);
        }else if(state is ListVideoError){
          return SliverToBoxAdapter(child: Text('Errors'));
        }
        return SliverToBoxAdapter(child: Text('something went wrong'));
      },
    );
  }
}
