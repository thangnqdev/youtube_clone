import 'package:youtube/features/domain/entities/info_video_trending.dart';
import 'package:youtube/features/domain/repository/info_video_trending_repository.dart';

class GetVideoTrendingInfo {
  final InfoVideoTrendingRepository repository;

  GetVideoTrendingInfo(this.repository);

  Future<List<InfoVideoTrending>> call() async {
    return await repository.getInfoVideoTrending();
  }
}
