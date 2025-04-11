import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube/features/presentations/bloc/navigation_bloc.dart';
import 'package:youtube/features/presentations/widgets/navigation/navigation_bar.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

Widget buildBottomNavigationBar(BuildContext context) {
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