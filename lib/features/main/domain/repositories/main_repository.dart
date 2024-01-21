import 'package:eco_market_app/features/main/domain/entities/category_entity.dart';

abstract class MainRepository {
  Future<List<CategoryEntity>> getCategories();
}
