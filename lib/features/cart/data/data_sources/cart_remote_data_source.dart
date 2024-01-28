import 'package:dio/dio.dart';
import 'package:eco_market_app/core/error/exception.dart';
import 'package:eco_market_app/features/cart/data/models/order_model.dart';

abstract class CartRemoteDataSource {
  Future<List<OrderModel>> getOrders();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio _dio;

  CartRemoteDataSourceImpl(this._dio);

  @override
  Future<List<OrderModel>> getOrders() async {
    try {
      var response =
          await _dio.get('https://neobook.online/ecobak/order-list/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> data = response.data;

        return data.map((e) => OrderModel.fromJson(e)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
