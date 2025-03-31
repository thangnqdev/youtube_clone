import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube/core/constants/assets/app_images.dart';
import 'package:youtube/core/constants/assets/app_vectors.dart';
import 'package:youtube/features/domain/entities/item_explore.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

List<ItemExplore> items = <ItemExplore>[
  ItemExplore(
    SvgPicture.asset(AppVectors.icTrend),
    'Trending',
    Image.asset(AppImages.imgTrending),
    LinearGradient(colors: <Color>[Colors.black, AppColors.trending]),
  ),
  ItemExplore(
    SvgPicture.asset(AppVectors.icMusic),
    'Music',
    Image.asset(AppImages.imgMusic),
    LinearGradient(colors: <Color>[Colors.black, AppColors.music]),
  ),
  ItemExplore(
    SvgPicture.asset(AppVectors.icGame),
    'Gaming',
    Image.asset(AppImages.imgGaming),
    LinearGradient(colors: <Color>[Colors.black, AppColors.gaming]),
  ),
  ItemExplore(
    SvgPicture.asset(AppVectors.icNews),
    'News',
    Image.asset(AppImages.imgNews),
    LinearGradient(colors: <Color>[Colors.black, AppColors.news]),
  ),
  ItemExplore(
    SvgPicture.asset(AppVectors.icMovie),
    'Films',
    Image.asset(AppImages.imgFilms),
    LinearGradient(colors: <Color>[Colors.black, AppColors.films]),
  ),
  ItemExplore(
    SvgPicture.asset(AppVectors.icClothes),
    'Fashion & beauty',
    Image.asset(AppImages.imgFob),
    LinearGradient(colors: <Color>[Colors.black, AppColors.fb]),
  ),
  ItemExplore(
    SvgPicture.asset(AppVectors.icLearn),
    'Learning',
    Image.asset(AppImages.imgLearning),
    LinearGradient(colors: <Color>[Colors.black, AppColors.learning]),
  ),
  ItemExplore(
    SvgPicture.asset(AppVectors.icLive),
    'Live',
    Image.asset(AppImages.imgLive),
    LinearGradient(colors: <Color>[Colors.black, AppColors.live]),
  ),
  ItemExplore(
    SvgPicture.asset(AppVectors.icSport),
    'Sport',
    Image.asset(AppImages.imgSport),
    LinearGradient(colors: <Color>[Colors.black, AppColors.sport]),
  ),
];
