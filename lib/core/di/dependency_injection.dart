import 'package:get_it/get_it.dart';
import 'package:youtube/core/network/dio_client.dart';
import 'package:youtube/features/data/repository/card_video_repository_impl.dart';
import 'package:youtube/features/data/sources/youtube_remote_srources.dart';
import 'package:youtube/features/domain/repository/info_video_repository.dart';
import 'package:youtube/features/domain/usecases/getVideoInfo.dart';
import 'package:youtube/features/presentations/pages/home/bloc/list_video_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton<YoutubeRemoteSrources>(
    () => YoutubeRemoteScroucesImp(sl()),
  );
  sl.registerLazySingleton<InfoVideoRepository>(
    () => CardVideoRepositoryImpl(sl()),
  );
  //domain
  sl.registerLazySingleton(() => Getvideoinfo(sl()));

  //presentation
  sl.registerLazySingleton(() => ListVideoBloc(sl()));
}
