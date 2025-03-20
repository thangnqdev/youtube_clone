import 'package:youtube/features/data/sources/youtube_remote_srources.dart';
import 'package:youtube/features/domain/entities/info_video.dart';
import 'package:youtube/features/domain/repository/info_video_repository.dart';

class CardVideoRepositoryImpl implements InfoVideoRepository {
  final YoutubeRemoteSrources remoteDataSrources;

  CardVideoRepositoryImpl(this.remoteDataSrources);
  @override
  Future<InfoVideo> getVideoInfo(String videoId) async {
    final model = await remoteDataSrources.getVideoInfor(videoId);
    return InfoVideo(
      title: model.title,
      description: model.description,
      thumbnailUrl: model.thumbnailUrl,
      viewCount: model.viewCount,
    );
  }
}
