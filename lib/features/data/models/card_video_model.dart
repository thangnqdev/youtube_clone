class CardVideoModel{
  final String thumbnailUrl;
  final String videoTitle;
  final String channelTitle;
  final String publishedAt;
  final int viewCount;

  CardVideoModel({
    required this.thumbnailUrl,
    required this.videoTitle,
    required this.channelTitle,
    required this.publishedAt,
    required this.viewCount
  });
  factory CardVideoModel.fromJson(Map<String, dynamic> json) {
    return CardVideoModel(
      thumbnailUrl: json['snippet']['thumbnails']['medium']['url'],
      videoTitle: json['snippet']['title'],
      channelTitle: json['snippet']['channelTitle'],
      publishedAt: json['snippet']['publishedAt'],
      viewCount: int.parse(json['statistics']['viewCount'] ?? '0'),
    );
  }
  static List<CardVideoModel> fromJsonList(Map<String, dynamic> json) {
    final List<dynamic> items = json['items'];
    return items.map((item) => CardVideoModel.fromJson(item)).toList();
  }
}
