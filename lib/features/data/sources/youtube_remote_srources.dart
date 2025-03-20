import 'package:youtube/core/network/dio_client.dart';
import 'package:youtube/features/data/models/card_video_model.dart';

abstract class YoutubeRemoteSrources {
  Future<CardVideoModel> getVideoInfor(String videoId);
}

class YoutubeRemoteScroucesImp implements YoutubeRemoteSrources {
  final DioClient dioClient;

  static const String apiKey = 'AIzaSyALbbze8mZZeOovr5OhOUL-vEG8XwuqYcs';
  YoutubeRemoteScroucesImp(this.dioClient);
  @override
  Future<CardVideoModel> getVideoInfor(String videoId) async {
    try {
      final response = await dioClient.get(
        '/videos',
        queryParameters: {
          'part': 'snippet,statistics',
          'id': videoId,
          'key': apiKey,
        },
      );
      return CardVideoModel.fromJson(response.data['item'][0]);
    } catch (e) {
      throw Exception('Fail to get video: $e');
    }
  }
}
