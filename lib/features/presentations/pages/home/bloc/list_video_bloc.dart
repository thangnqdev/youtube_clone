import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/features/domain/usecases/getVideoInfo.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_event.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_state.dart';

class ListVideoBloc extends Bloc<ListVideoEvent, ListVideoState> {
  final Getvideoinfo getvideoinfo;

  ListVideoBloc(this.getvideoinfo) : super(ListVideoInital()) {
    on<FetchVideoYoutubeInfo>((event, emit) async {
      emit(ListVideoLoading());
      try {
        final video = await getvideoinfo(event.videoId);
        emit(ListVideoLoaded(video));
      } catch (e) {
        emit(ListVideoError(e.toString()));
      }
    });
  }
}
