import 'package:dio/dio.dart';
import 'package:eco_market_app/features/main/data/data_sources/main_remote_data_source.dart';
import 'package:eco_market_app/features/main/data/repositories/main_repo_impl.dart';
import 'package:eco_market_app/features/main/domain/repositories/main_repository.dart';
import 'package:eco_market_app/features/main/presentation/cubit/cubit/main_screen_cubit.dart';
import 'package:eco_market_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:eco_market_app/features/search/data/repositories/search_repo_impl.dart';
import 'package:eco_market_app/features/search/domain/repositories/search_repository.dart';
import 'package:eco_market_app/features/search/presentation/cubit/cubit/search_screen_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => MainScreenCubit(sl()));
  sl.registerLazySingleton<MainRepository>(() => MainRepoImpl(sl()));
  sl.registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(sl()));

  sl.registerFactory(() => SearchScreenCubit(sl()));
  sl.registerLazySingleton<SearchRepository>(() => SearchRepoImpl(sl()));
  sl.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton(() => Dio());
}
