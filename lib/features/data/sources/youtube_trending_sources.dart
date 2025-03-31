import 'package:youtube/core/constants/token/token.dart';
import 'package:youtube/core/network/dio_client.dart';
import 'package:youtube/features/data/models/card_video_trending_model.dart';

abstract class YoutubeTrendingSources {
  Future<List<CardVideoTrendingModel>> getVideoTrendingInfo();
}

class YoutubeTrendingSourcesImp extends YoutubeTrendingSources {
  final DioClient dioClient;
  static const String apiKey = Token.token;

  YoutubeTrendingSourcesImp(this.dioClient);
  @override
  Future<List<CardVideoTrendingModel>> getVideoTrendingInfo() async {
    try {
      final response = await dioClient.get(
        '/videos',
        queryParameters: {
          'key': Token.token,
          'regionCode': 'VN',
          'part': 'snippet,statistics',
          'chart': 'mostPopular',
          'maxResults': '20',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        return CardVideoTrendingModel.fromJsonList(jsonData);
      } else {
        throw Exception(
          'Failed to load videos: ${response.statusCode} - ${response.data}',
        );
      }
    } catch (e) {
      throw Exception('Fail to get video: $e');
    }
  }
}
