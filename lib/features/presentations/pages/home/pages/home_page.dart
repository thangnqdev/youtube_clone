import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/features/presentations/bloc/navigation_bloc.dart';
import 'package:youtube/features/presentations/pages/explore/pages/body_explore_page.dart';
import 'package:youtube/features/presentations/pages/explore/pages/explore_page.dart';
import 'package:youtube/features/presentations/pages/home/pages/body_home_page.dart';
import 'package:youtube/features/presentations/pages/home/widget/build_bottom_navigation_bar.dart';
import 'package:youtube/features/presentations/pages/home/widget/build_visibility_full_size.dart';
import 'package:youtube/features/presentations/pages/library/pages/body_library_page.dart';
import 'package:youtube/features/presentations/pages/library/pages/top_body_library_page.dart';
import 'package:youtube/features/presentations/pages/library/pages/library_page.dart';
import 'package:youtube/features/presentations/pages/subscription/pages/subscription_page.dart';
import 'package:youtube/features/presentations/utils/fetch_data.dart';
import 'package:youtube/features/presentations/widgets/appbar/app_bar.dart';
import 'package:youtube/features/presentations/widgets/appbar/sup_app_bar.dart';
import 'package:youtube/features/presentations/widgets/appbar/sup_app_bar_supscription.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  final String? videoId;
  const HomePage({super.key, this.videoId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<double> _widthAnimation;
  late double miniHeight;
  late double miniWidth;
  late double fullHeight;
  late double fullWidth;
  bool isMini = false;
  bool isPlayerVisible = false;

  YoutubePlayerController? _controllerYoutube;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fullHeight = MediaQuery.of(context).size.height;
    fullWidth = MediaQuery.of(context).size.width;
    miniHeight = MediaQuery.of(context).size.height / 5.5;
    miniWidth = MediaQuery.of(context).size.width / 2;
    _heightAnimation = Tween<double>(
      begin: miniHeight,
      end: fullHeight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _widthAnimation = Tween<double>(
      begin: miniWidth,
      end: fullWidth,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controllerYoutube?.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _showPlayer(String id) {
    if (_controllerYoutube == null) {
      _controllerYoutube = YoutubePlayerController(
        initialVideoId: id,
        flags: const YoutubePlayerFlags(autoPlay: true, mute: true),
      );
    } else {
      _controllerYoutube!.load(id);
    }
    setState(() {
      isPlayerVisible = true;
      isMini = false;
      _controller.value = 1.0;
    });
  }

  void _togglePlayer() {
    if (isMini) {
      _controller.forward();
      setState(() {
        isMini = false;
      });
    } else {
      _controller.reverse();
      setState(() {
        isMini = true;
      });
    }
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    double delta = -details.primaryDelta! / fullHeight;
    _controller.value = (_controller.value + delta).clamp(0.0, 1.0);
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.value > 0.5) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      _controller.forward();
      setState(() {
        isMini = false;
      });
    } else {
      _controller.reverse();
      setState(() {
        isMini = true;
      });
    }
  }

  void _closePlayer() {
    _controllerYoutube?.pause();
    setState(() {
      isPlayerVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await refreshData(context),
      child: Stack(
        children: [
          Scaffold(
            body: BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, state) => _buildBody(state.currentIndex),
            ),
            bottomNavigationBar: buildBottomNavigationBar(context),
          ),
          Visibility(
            visible: isPlayerVisible,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  bottom: isMini ? 120 : 0,
                  right: isMini ? 8 : 0,
                  height: _heightAnimation.value,
                  width: _widthAnimation.value,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        if (_controllerYoutube != null)
                          YoutubePlayer(
                            controller: _controllerYoutube!,
                            aspectRatio: 16 / 9,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: AppColors.subText,
                          ),
                        GestureDetector(
                          onVerticalDragUpdate: _handleDragUpdate,
                          onVerticalDragEnd: _handleDragEnd,
                          onTap: _togglePlayer,
                          child: Container(
                            height: 20,
                            color: Colors.white,
                            child: Center(
                              child: Container(
                                width: 40,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: AppColors.subText,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (isMini == true)
                          Expanded(
                            child: Center(
                              child: IconButton(
                                onPressed: () => _closePlayer(),
                                icon: Icon(Icons.close_sharp),
                              ),
                            ),
                          ),
                        if (isMini == false)
                          Expanded(
                            child: Material(
                              child: CustomScrollView(
                                slivers: [
                                  SliverToBoxAdapter(
                                    child: buildVisibilityFullSize(context),
                                  ),
                                  BodyExplorePage(callBack: _showPlayer)
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(int currentIndex) {
    final body = switch (currentIndex) {
      0 => BodyHomePage(callBack: _showPlayer),
      1 => const ExplorePage(),
      3 => SubscriptionPage(callBack: _showPlayer),
      4 => const LibraryPage(),
      _ => BodyHomePage(callBack: _showPlayer),
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
            BodyExplorePage(callBack: _showPlayer),
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
          slivers: [
            const BaseAppBar(),
            body,
            TopBodyLibraryPage(callBack: _showPlayer),
            BodyLibraryPage(),
          ],
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
