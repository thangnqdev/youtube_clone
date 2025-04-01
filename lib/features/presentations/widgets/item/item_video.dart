import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube/core/constants/assets/app_vectors.dart';
import 'package:youtube/features/data/models/card_video_model.dart';
import 'package:youtube/features/presentations/bloc/is_dark_mode.dart';

class ItemVideo extends StatelessWidget {
  final String thumbnailUrl;
  final String videoTitle;
  final String channelTitle;
  final String publishedAt;
  final int viewCount;
  final double heightImg;
  final double widthImg;
  final double sizeTitleVideo;
  final double sizeTitleChannel;
  const ItemVideo({
    super.key,
    required this.thumbnailUrl,
    required this.videoTitle,
    required this.channelTitle,
    required this.publishedAt,
    required this.viewCount,
    required this.heightImg,
    required this.widthImg,
    required this.sizeTitleVideo,
    required this.sizeTitleChannel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          thumbnailUrl,
          fit: BoxFit.fill,
          height: heightImg,
          width: widthImg, 
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 36,
                  width: 36,
                  child: Icon(Icons.account_circle_outlined),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        videoTitle,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              channelTitle,
                              maxLines: 1,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: sizeTitleChannel,
                                color: Color(0XFF606060),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              CardVideoModel.formatViewCount(viewCount),
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0XFF606060),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              CardVideoModel.formatPublishedAt(publishedAt),
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0XFF606060),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  context.isDarkMode
                      ? AppVectors.moreVertDarkMode
                      : AppVectors.moreVert,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
