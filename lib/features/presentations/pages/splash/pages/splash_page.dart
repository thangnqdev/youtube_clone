import 'package:flutter/material.dart';
import 'package:youtube/core/constants/assets/app_images.dart';
import 'package:youtube/features/presentations/pages/home/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = Duration(seconds: 2);
    Future.delayed(duration, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 84,
          width: 120,
          child: Image.asset(AppImages.logoSplash),
        ),
      ),
    );
  }
}
