import 'package:eco_market_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:eco_market_app/features/search/domain/entities/product_entity.dart';
import 'package:eco_market_app/features/search/domain/repositories/search_repository.dart';

class SerchrepoImpl implements SearchRepository {
  final SearchRemoteDataSource _searchRemoteDataSource;

  SerchrepoImpl(this._searchRemoteDataSource);

  @override
  Future<List<ProductEntity>> getProducts(
          {String? productType, String? search}) async =>
      await _searchRemoteDataSource.getProducts(
          productType: productType, search: search);
}
