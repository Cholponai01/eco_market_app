import 'package:eco_market_app/features/cart/domain/entities/order_entity.dart';

abstract class CartRepository {
  Future<List<OrderEntity>> getOrders();
}
