import 'package:youtube/features/data/sources/youtube_trending_sources.dart';
import 'package:youtube/features/domain/entities/info_video_trending.dart';
import 'package:youtube/features/domain/repository/info_video_trending_repository.dart';

class CardVideoTrendingRepositoryImpl implements InfoVideoTrendingRepository {
  final YoutubeTrendingSources youtubeTrendingSources;

  CardVideoTrendingRepositoryImpl(this.youtubeTrendingSources);
  @override
  Future<List<InfoVideoTrending>> getInfoVideoTrending() async {
    final jsonData = await youtubeTrendingSources.getVideoTrendingInfo();
    return jsonData
        .map(
          (model) => InfoVideoTrending(
            id: model.id,
            thumbnailUrl: model.thumbnailUrl,
            videoTitle: model.videoTitle,
            channelTitle: model.channelTitle,
            publishedAt: model.publishedAt,
            viewCount: model.viewCount,
          ),
        )
        .toList();
  }
}
