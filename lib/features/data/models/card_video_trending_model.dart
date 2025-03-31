class CardVideoTrendingModel{
  final String id;
  final String thumbnailUrl;
  final String videoTitle;
  final String channelTitle;
  final String publishedAt;
  final int viewCount;
  CardVideoTrendingModel({
    required this.id,
    required this.thumbnailUrl,
    required this.videoTitle,
    required this.channelTitle,
    required this.publishedAt,
    required this.viewCount,
  });
  factory CardVideoTrendingModel.fromJson(Map<String, dynamic> json) {
    return CardVideoTrendingModel(
      id: json['id'],
      thumbnailUrl: json['snippet']['thumbnails']['medium']['url'],
      videoTitle: json['snippet']['title'],
      channelTitle: json['snippet']['channelTitle'],
      publishedAt: json['snippet']['publishedAt'],
      viewCount: int.parse(json['statistics']['viewCount'] ?? '0'),
    );
  }

  static List<CardVideoTrendingModel> fromJsonList(Map<String, dynamic> json) {
    final List<dynamic> items = json['items'];
    return items.map((item) => CardVideoTrendingModel.fromJson(item)).toList();
  }
}
