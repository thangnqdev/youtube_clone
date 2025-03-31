import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/features/domain/usecases/get_video_info.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_event.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_state.dart';

class ListVideoBloc extends Bloc<ListVideoEvent, ListVideoState> {
  final GetvideoInfo getvideoInfo;

  ListVideoBloc(this.getvideoInfo) : super(ListVideoLoading()) {
    on<FetchVideoYoutubeInfo>((event, emit) async {
      emit(ListVideoLoading());
      try {
        final video = await getvideoInfo();
        emit(ListVideoSuccess(video));
      } catch (e) {
        emit(ListVideoError(e.toString()));
      }
    });
  }
}
