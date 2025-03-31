import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/features/domain/usecases/get_video_trending_info.dart';
import 'package:youtube/features/presentations/pages/explore/pages/bloc/list_video_trending_event.dart';
import 'package:youtube/features/presentations/pages/explore/pages/bloc/list_video_trending_state.dart';

class ListVideoTrendingBloc extends Bloc<ListVideoTrendingEvent, ListVideoTrendingState>{
  final GetVideoTrendingInfo getVideoTrendingInfo;
  
  ListVideoTrendingBloc(this.getVideoTrendingInfo) : super(ListVideoTrendingLoading()){
    on<FetchVideoTrendingInfo>((event, emit) async {
      emit(ListVideoTrendingLoading());
      try {
        final video = await getVideoTrendingInfo();
        emit(ListVideoTrendingSuccess(video));
      } catch (e) {
        emit(ListVideoTrendingErrors(e.toString()));
      }
    });
  }

}