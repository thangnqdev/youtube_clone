import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/features/presentations/bloc/navigation_bloc.dart';
import 'package:youtube/features/presentations/pages/home/pages/body_home_page.dart';
import 'package:youtube/features/presentations/widgets/appbar/app_bar.dart';
import 'package:youtube/features/presentations/widgets/appbar/sup_app_bar.dart';
import 'package:youtube/features/presentations/widgets/navigation/navigation_bar.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationBloc(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [BaseAppBar(), SupAppBar(), BodyHomePage()],
          ),
        ),
        bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: BaseNavigationBar(
                backgroundColor: Colors.transparent,
                selectedItemColor: Colors.black,
                currentIndex: state.currentIndex,
                onTap: (index) {
                  context.read<NavigationBloc>().add(NavigateToTab(index));
                  switch (index) {}
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
