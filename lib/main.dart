import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/core/di/dependency_injection.dart';
import 'package:youtube/features/presentations/bloc/navigation_bloc.dart';
import 'package:youtube/features/presentations/pages/explore/pages/bloc/list_video_trending_bloc.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_bloc.dart';
import 'package:youtube/features/presentations/pages/splash/pages/splash_page.dart';
import 'package:youtube/features/presentations/widgets/theme/app_theme.dart';
import 'package:youtube/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<NavigationBloc>()),
        BlocProvider(create: (context) => sl<ListVideoBloc>()),
        BlocProvider(create: (context) => sl<ListVideoTrendingBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        themeMode: ThemeMode.system,
        home: SplashPage(),
      ),
    );
  }
}
