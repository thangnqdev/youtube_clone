import 'package:youtube/features/data/sources/youtube_mostPopular_srources.dart';
import 'package:youtube/features/domain/entities/info_video.dart';
import 'package:youtube/features/domain/repository/info_video_repository.dart';

class CardVideoRepositoryImpl implements InfoVideoRepository {
  final YoutubeMostpopularSrources remoteDataSrources;

  CardVideoRepositoryImpl(this.remoteDataSrources);
  @override
  Future<List<InfoVideo>> getVideoInfo() async {
    final jsonData = await remoteDataSrources.getVideoInfo();
    return jsonData
        .map(
          (model) => InfoVideo(
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
