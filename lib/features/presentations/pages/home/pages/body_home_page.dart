import 'package:flutter/material.dart';
import 'package:youtube/features/presentations/pages/home/widget/item_video.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return ItemVideo();
      },
      itemCount: 10,
    );
  }
}
