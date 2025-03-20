import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/core/di/dependency_injection.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_bloc.dart';
import 'package:youtube/features/presentations/pages/splash/pages/splash_page.dart';
import 'package:youtube/features/presentations/widgets/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: ThemeMode.system,
      home: BlocProvider(
        create: (_) => sl<ListVideoBloc>(),
        child: SplashPage(),
      ),
    );
  }
}
