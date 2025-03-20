abstract class ListVideoEvent {}

class FetchVideoYoutubeInfo extends ListVideoEvent {
  final String videoId;

  FetchVideoYoutubeInfo(this.videoId);
}
