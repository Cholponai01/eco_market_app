import 'package:eco_market_app/features/search/domain/entities/product_entity.dart';

abstract class SearchRepository {
  Future<List<ProductEntity>> getProducts(
      {String? productType, String? search});
}
