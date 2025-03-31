
import 'package:youtube/features/domain/entities/info_video_trending.dart';

abstract class ListVideoTrendingState {}

class ListVideoTrendingLoading extends ListVideoTrendingState {}

class ListVideoTrendingSuccess extends ListVideoTrendingState {
  final List<InfoVideoTrending> videos;

  ListVideoTrendingSuccess(this.videos);
}

class ListVideoTrendingErrors extends ListVideoTrendingState {
  final String mess;

  ListVideoTrendingErrors(this.mess);
}
