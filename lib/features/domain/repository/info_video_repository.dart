import 'package:youtube/features/domain/entities/info_video.dart';

abstract class InfoVideoRepository {
  Future<InfoVideo> getVideoInfo(String videoId);
}
