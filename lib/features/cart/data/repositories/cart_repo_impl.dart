import 'package:eco_market_app/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:eco_market_app/features/cart/domain/entities/order_entity.dart';
import 'package:eco_market_app/features/cart/domain/repositories/cart_repository.dart';

class CartRepoImpl implements CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRepoImpl(this._cartRemoteDataSource);

  @override
  Future<List<OrderEntity>> getOrders() async =>
      await _cartRemoteDataSource.getOrders();
}
