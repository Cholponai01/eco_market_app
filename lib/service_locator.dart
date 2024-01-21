import 'package:dio/dio.dart';
import 'package:eco_market_app/features/main/data/data_sources/main_remote_data_source.dart';
import 'package:eco_market_app/features/main/data/repositories/main_repo_impl.dart';
import 'package:eco_market_app/features/main/domain/repositories/main_repository.dart';
import 'package:eco_market_app/features/main/presentation/cubit/cubit/main_screen_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => MainScreenCubit(sl()));

  sl.registerLazySingleton<MainRepository>(() => MainRepoImpl(sl()));
  sl.registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton(() => Dio());
}
