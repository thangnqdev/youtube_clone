import 'package:get_it/get_it.dart';
import 'package:youtube/core/network/dio_client.dart';
import 'package:youtube/features/data/repository/card_video_repository_impl.dart';
import 'package:youtube/features/data/repository/card_video_trending_repository_impl.dart';
import 'package:youtube/features/data/sources/youtube_mostPopular_srources.dart';
import 'package:youtube/features/data/sources/youtube_trending_sources.dart';
import 'package:youtube/features/domain/repository/info_video_repository.dart';
import 'package:youtube/features/domain/repository/info_video_trending_repository.dart';
import 'package:youtube/features/domain/usecases/get_video_info.dart';
import 'package:youtube/features/domain/usecases/get_video_trending_info.dart';
import 'package:youtube/features/presentations/bloc/navigation_bloc.dart';
import 'package:youtube/features/presentations/pages/explore/pages/bloc/list_video_trending_bloc.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_bloc.dart';

final sl = GetIt.instance;

void init() {
  
  sl.registerSingleton<NavigationBloc>(NavigationBloc());
  sl.registerLazySingleton(() => DioClient());


  //most popular video
  sl.registerLazySingleton<YoutubeMostpopularSrources>(
    () => YoutubeMostpopularSrourcesImp(sl()),
  );

  sl.registerLazySingleton<InfoVideoRepository>(
    () => CardVideoRepositoryImpl(sl()),
  );


  //trending video
  sl.registerLazySingleton<YoutubeTrendingSources>(
    () => YoutubeTrendingSourcesImp(sl()),
  );
  sl.registerLazySingleton<InfoVideoTrendingRepository>(
    () => CardVideoTrendingRepositoryImpl(sl()),
  );


  //domain
  sl.registerLazySingleton(() => GetvideoInfo(sl()));

  //presentation
  sl.registerLazySingleton(() => ListVideoBloc(sl()));
  sl.registerLazySingleton(() => ListVideoTrendingBloc(sl()));
  sl.registerLazySingleton(() => GetVideoTrendingInfo(sl()));
}
