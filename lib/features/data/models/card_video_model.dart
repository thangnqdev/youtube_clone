class CardVideoModel{
  final String id;
  final String thumbnailUrl;
  final String videoTitle;
  final String channelTitle;
  final String publishedAt;
  final int viewCount;

  CardVideoModel({
    required this.id,
    required this.thumbnailUrl,
    required this.videoTitle,
    required this.channelTitle,
    required this.publishedAt,
    required this.viewCount
  });
  factory CardVideoModel.fromJson(Map<String, dynamic> json) {
    return CardVideoModel(
      id: json['id'],
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
  static String formatViewCount(int viewCount){
    if(viewCount >= 1000000000){
      return '${(viewCount / 1000000000).toStringAsFixed(1)}B views';
    }else if(viewCount >= 1000000){
      return '${(viewCount / 1000000).toStringAsFixed(1)}M views';
    }else if(viewCount >= 1000){
      return '${(viewCount / 1000).toStringAsFixed(1)}K views';
    }else{
      return '${viewCount.toString()} views';
    }
  }
  static String formatPublishedAt(String time){
    DateTime upload = DateTime.parse(time);
    DateTime timeNow = DateTime.now();
    Duration difference = timeNow.difference(upload);

    int seconds = difference.inSeconds;
    int minutes = difference.inMinutes;
    int hours = difference.inHours;
    int days = difference.inDays;
    int months = (days / 30).floor();
    int years = (days / 365).floor();

    if(years > 0){
      return '$years years ago';
    }else if(months > 0){
      return '$months months ago';
    }else if(days > 0){
      return '$days days ago';
    }else if(hours > 0){
      return '$hours hours ago';
    }else if(minutes > 0){
      return '$minutes minutes ago';
    }else{
      return '$seconds seconds ago';
    }
  }
}
