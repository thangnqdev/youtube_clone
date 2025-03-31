import 'package:youtube/core/constants/token/token.dart';
import 'package:youtube/core/network/dio_client.dart';
import 'package:youtube/features/data/models/card_video_model.dart';

abstract class YoutubeMostpopularSrources {
  Future<List<CardVideoModel>> getVideoInfo();
}

class YoutubeMostpopularSrourcesImp implements YoutubeMostpopularSrources {
  final DioClient dioClient;

  YoutubeMostpopularSrourcesImp(this.dioClient);
  @override
  Future<List<CardVideoModel>> getVideoInfo() async {
    try {
      final response = await dioClient.get(
        '/videos',
        queryParameters: {
          'key': Token.token,
          'part': 'snippet,statistics',
          'chart': 'mostPopular',
          'maxResults': '20',          
        },
      );
      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        return CardVideoModel.fromJsonList(jsonData);
      } else {
        throw Exception('Failed to load videos: ${response.statusCode} - ${response.data}');
      }
    } catch (e) {
      throw Exception('Fail to get video: $e');
    }
  }
}
