import 'package:flutter/material.dart';
import 'package:youtube/core/constants/assets/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: Image.asset(AppImages.imageLogo),
        ),
      ),
    );
  }
}
