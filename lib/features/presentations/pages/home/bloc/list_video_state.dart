import 'package:youtube/features/domain/entities/info_video.dart';

abstract class ListVideoState {}

class ListVideoLoading extends ListVideoState {}

class ListVideoSuccess extends ListVideoState {
  final List<InfoVideo> videos;
  ListVideoSuccess(this.videos);
}
class ListVideoError extends ListVideoState {
  final String message;
  ListVideoError(this.message);
}
