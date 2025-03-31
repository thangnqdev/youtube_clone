import 'package:youtube/features/domain/entities/info_video.dart';
import 'package:youtube/features/domain/repository/info_video_repository.dart';

class GetvideoInfo {
  final InfoVideoRepository repository;

  GetvideoInfo(this.repository);

  Future<List<InfoVideo>> call() async {
    return await repository.getVideoInfo();
  }
}
