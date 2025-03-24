import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/features/presentations/bloc/navigation_bloc.dart';
import 'package:youtube/features/presentations/pages/explore/pages/explore_page.dart';
import 'package:youtube/features/presentations/pages/home/pages/body_home_page.dart';
import 'package:youtube/features/presentations/pages/library/pages/library_page.dart';
import 'package:youtube/features/presentations/pages/subscription/pages/subscription_page.dart';
import 'package:youtube/features/presentations/widgets/appbar/app_bar.dart';
import 'package:youtube/features/presentations/widgets/appbar/sup_app_bar.dart';
import 'package:youtube/features/presentations/widgets/navigation/navigation_bar.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) => _buildBody(state.currentIndex),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  /// Xây dựng nội dung của Body dựa vào currentIndex
  Widget _buildBody(int currentIndex) {
    final body = switch (currentIndex) {
      0 => const BodyHomePage(),
      1 => const ExplorePage(),
      3 => const SubscriptionPage(),
      4 => const LibraryPage(),
      _ => const BodyHomePage(),
    };

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          const BaseAppBar(),
          const SupAppBar(),
          body,
        ],
      ),
    );
  }

  /// Xây dựng Bottom Navigation Bar
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
            onTap: (index) =>
                context.read<NavigationBloc>().add(NavigateToTab(index)),
          ),
        );
      },
    );
  }
}
