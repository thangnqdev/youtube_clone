import 'package:youtube/features/domain/entities/info_video_trending.dart';

abstract class InfoVideoTrendingRepository {
  Future<List<InfoVideoTrending>> getInfoVideoTrending();
}