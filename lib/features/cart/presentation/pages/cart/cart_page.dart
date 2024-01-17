import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/config/theme/app_colors.dart';
import 'package:eco_market_app/features/main/presentation/widgets/shopping_cart_item.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ShoppingCartItem> cartItems =
      List.generate(20, (index) => ShoppingCartItem());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Очистить",
                  style: TextStyle(
                    color: AppColors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 50),
              const Text(
                "Корзина",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  ShoppingCartItem item = cartItems[index];

                  return ListTile();
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: cartItems.length),
          ],
        ));
  }
}
