import 'package:youtube/features/domain/entities/info_video.dart';

abstract class InfoVideoRepository {
  Future<List<InfoVideo>> getVideoInfo();
}
