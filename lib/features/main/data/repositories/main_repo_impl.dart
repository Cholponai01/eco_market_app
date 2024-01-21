import 'package:eco_market_app/features/main/data/data_sources/main_remote_data_source.dart';
import 'package:eco_market_app/features/main/domain/entities/category_entity.dart';
import 'package:eco_market_app/features/main/domain/repositories/main_repository.dart';

class MainRepoImpl implements MainRepository {
  final MainRemoteDataSource _remoteDataSource;

  MainRepoImpl(this._remoteDataSource);

  @override
  Future<List<CategoryEntity>> getCategories() async =>
      await _remoteDataSource.getCategories();
}
