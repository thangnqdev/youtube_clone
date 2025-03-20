import 'package:youtube/features/domain/entities/info_video.dart';

abstract class ListVideoState {}

class ListVideoInital extends ListVideoState {}

class ListVideoLoading extends ListVideoState {}

class ListVideoLoaded extends ListVideoState {
  final InfoVideo video;
  ListVideoLoaded(this.video);
}

class ListVideoError extends ListVideoState {
  final String message;
  ListVideoError(this.message);
}
