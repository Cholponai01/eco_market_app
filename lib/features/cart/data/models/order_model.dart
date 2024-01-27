import 'package:eco_market_app/features/cart/data/models/ordered_product_model.dart';
import 'package:eco_market_app/features/cart/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    super.orderNumber,
    super.phoneNumber,
    super.address,
    super.referencePoint,
    super.comments,
    super.totalAmount,
    super.createdAt,
    super.deliveryCost,
    super.orderedProducts,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderNumber: json["order_number"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        referencePoint: json["reference_point"],
        comments: json["comments"],
        totalAmount: json["total_amount"],
        createdAt: json["created_at"],
        deliveryCost: json["delivery_cost"],
        orderedProducts: List<OrderedProductModel>.from(json["ordered_products"]
            .map((x) => OrderedProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_number": orderNumber,
        "phone_number": phoneNumber,
        "address": address,
        "reference_point": referencePoint,
        "comments": comments,
        "total_amount": totalAmount,
        "created_at": createdAt,
        "delivery_cost": deliveryCost,
        "ordered_products":
            List<dynamic>.from(orderedProducts!.map((x) => x.toJson())),
      };
}
