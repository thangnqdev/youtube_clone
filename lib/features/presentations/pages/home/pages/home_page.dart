import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/features/presentations/bloc/is_dark_mode.dart';
import 'package:youtube/features/presentations/bloc/navigation_bloc.dart';
import 'package:youtube/features/presentations/pages/explore/pages/body_explore_page.dart';
import 'package:youtube/features/presentations/pages/explore/pages/explore_page.dart';
import 'package:youtube/features/presentations/pages/home/pages/body_home_page.dart';
import 'package:youtube/features/presentations/pages/library/pages/body_library_page.dart';
import 'package:youtube/features/presentations/pages/library/pages/top_body_library_page.dart';
import 'package:youtube/features/presentations/pages/library/pages/library_page.dart';
import 'package:youtube/features/presentations/pages/subscription/pages/subscription_page.dart';
import 'package:youtube/features/presentations/widgets/appbar/app_bar.dart';
import 'package:youtube/features/presentations/widgets/appbar/sup_app_bar.dart';
import 'package:youtube/features/presentations/widgets/appbar/sup_app_bar_supscription.dart';
import 'package:youtube/features/presentations/widgets/navigation/navigation_bar.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late YoutubePlayerController youtubePlayerController;
  String playState = 'hidden';

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    )..addListener(() {
      setState(() {});
    });
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    youtubePlayerController.dispose();
    super.dispose();
  }

  void videoId(String id) {
    youtubePlayerController.load(id);
    setState(() {
      playState = 'full';
    });
  }

  @override
  Widget build(BuildContext context) {
    // ANIMATION
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Animation<RelativeRect> playScreenRect;
    if (playState == 'hidden') {
      playScreenRect = RelativeRectTween(
        begin: RelativeRect.fromLTRB(
          0.0,
          screenHeight,
          0.0,
          0.0,
        ), // Ẩn dưới màn hình
        end: RelativeRect.fromLTRB(0.0, screenHeight, 0.0, 0.0),
      ).animate(animation);
    } else if (playState == 'full') {
      playScreenRect = RelativeRectTween(
        begin: RelativeRect.fromLTRB(
          screenWidth / 10 * 4,
          screenHeight / 10 * 6.6,
          10.0,
          100,
        ), // // Từ dưới lên
        end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0), // Full màn hình
      ).animate(animation);
    } else {
      // Trạng thái thu nhỏ (mini)
      playScreenRect = RelativeRectTween(
        begin: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0), // Từ full
        end: RelativeRect.fromLTRB(
          screenWidth / 10 * 4,
          screenHeight / 10 * 6.6,
          10.0,
          100,
        ), // Thu nhỏ
      ).animate(animation);
    }

    // DỰNG UI HOMEPAGE
    return Stack(
      children: [
        Scaffold(
          body: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) => _buildBody(state.currentIndex),
          ),
          bottomNavigationBar: _buildBottomNavigationBar(context),
        ),
        PositionedTransition(
          rect: playScreenRect,
          child: SizedBox(
            width:
                playState == 'full'
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.height / 4,
            child: ColoredBox(
              color:
                  context.isDarkMode
                      ? AppColors.backgroundDarkMode
                      : AppColors.backgroundLightMode,
              child: Column(
                children: [
                  GestureDetector(
                    onVerticalDragEnd: (details) {
                      if (details.primaryVelocity! > 0) {
                        // Vuốt xuống
                        setState(() {
                          playState = 'mini'; // Chuyển sang trạng thái thu nhỏ
                        });
                        animationController.forward(from: 0.0).whenComplete(() {
                          print("Video đã thu nhỏ");
                        });
                      } else if (details.primaryVelocity! < 0) {
                        // Vuốt lên
                        setState(() {
                          playState = 'full'; // Chuyển sang trạng thái full
                        });
                        animationController.forward(from: 0.0);
                      }
                    },
                    child: YoutubePlayer(
                      aspectRatio: 16 / 9,
                      controller: youtubePlayerController,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: AppColors.subText,
                      onReady: () => print('start'),
                    ),
                  ),
                  if (playState == 'mini')
                    Align(
                      alignment: Alignment.topCenter,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            playState = 'hidden';
                            youtubePlayerController.pause();
                          });
                          animationController.reverse().whenComplete(
                            () => print('video đã đóng'),
                          );
                        },
                        icon: Icon(Icons.close),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ĐIỀU HƯỚNG TABTAB
  Widget _buildBody(int currentIndex) {
    final body = switch (currentIndex) {
      0 => BodyHomePage(controller: animationController, videoId: videoId),
      1 => const ExplorePage(),
      3 => SubscriptionPage(controller: animationController, videoId: videoId),
      4 => const LibraryPage(),
      _ => BodyHomePage(controller: animationController, videoId: videoId),
    };
    if (currentIndex == 1) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            const BaseAppBar(),
            const SupAppBar(),
            body,
            BodyExplorePage(controller: animationController, videoId: videoId),
          ],
        ),
      );
    } else if (currentIndex == 3) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [const BaseAppBar(), const SupAppBarSupscription(), body],
        ),
      );
    } else if (currentIndex == 4) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [const BaseAppBar(), body, TopBodyLibraryPage(), BodyLibraryPage()],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [const BaseAppBar(), const SupAppBar(), body],
        ),
      );
    }
  }
}

// DỰNG BOTTOM NAVIGATION
Widget _buildBottomNavigationBar(BuildContext context) {
  return BlocBuilder<NavigationBloc, NavigationState>(
    builder: (context, state) {
      return Container(
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: BaseNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.black,
          currentIndex: state.currentIndex,
          onTap:
              (index) =>
                  context.read<NavigationBloc>().add(NavigateToTab(index)),
        ),
      );
    },
  );
}
