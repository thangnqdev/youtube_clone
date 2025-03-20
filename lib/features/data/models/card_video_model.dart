class CardVideoModel {
  final String title;
  final String description;
  final String thumbnailUrl;
  final int viewCount;

  CardVideoModel({
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.viewCount,
  });
  factory CardVideoModel.fromJson(Map<String, dynamic> json) {
    return CardVideoModel(
      title: json['snippet']['title'],
      description: json['snippet']['dedescriptionsc'],
      thumbnailUrl: json['snippet']['thumbnails']['medium']['url'],
      viewCount: int.parse(json['statistics']['viewCount']),
    );
  }
}
