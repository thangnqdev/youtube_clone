import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/features/presentations/pages/explore/pages/bloc/list_video_trending_bloc.dart';
import 'package:youtube/features/presentations/pages/explore/pages/bloc/list_video_trending_event.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_bloc.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_event.dart';

Future<void> refreshData(BuildContext context) async {
  context.read<ListVideoBloc>().add(FetchVideoYoutubeInfo());
  context.read<ListVideoTrendingBloc>().add(FetchVideoTrendingInfo());
}
