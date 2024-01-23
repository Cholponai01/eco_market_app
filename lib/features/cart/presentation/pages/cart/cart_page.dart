import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/config/theme/app_colors.dart';
import 'package:eco_market_app/features/cart/presentation/widgets/order_dialog.dart';
import 'package:eco_market_app/features/cart/presentation/widgets/texts_widget.dart';
import 'package:eco_market_app/features/main/presentation/widgets/shopping_cart_item.dart';
import 'package:eco_market_app/features/search/presentation/widgets/custom_button_widget.dart';
import 'package:eco_market_app/features/search/presentation/widgets/icon_button_widget.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 12.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                height: 94,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.lightGrey,
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "assets/images/products/pitaya.png",
                          height: 86,
                          width: 86,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 56,
                          child: GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: 32,
                              width: 32,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.white),
                                child: const Icon(
                                  Icons.delete,
                                  color: AppColors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Драконий фрукт",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black),
                          ),
                          const Text(
                            "Цена 340 с за шт",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkGrey),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "340 с",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.darkGrey),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.21,
                                ),
                                Row(children: [
                                  IconButtonWidget(
                                    icon: Icons.remove,
                                    onTap: () {
                                      setState(() {
                                        cartItems[0].decrementCounter();
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 24),
                                  Text(
                                    cartItems[0].getCounter().toString(),
                                    style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(width: 24),
                                  IconButtonWidget(
                                    icon: Icons.add,
                                    onTap: () {
                                      setState(() {
                                        cartItems[0].incrementCounter();
                                      });
                                    },
                                  ),
                                ]),
                              ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              texts('Сумму', '499 c'),
              const SizedBox(height: 8),
              texts('Доставка', '110 c'),
              const SizedBox(height: 8),
              texts('Итого', '609 c'),
              const SizedBox(height: 50),
              CustomButtonWidget(
                onPressed: () => orderDialog(context),
                text: 'Оформить заказ',
                height: 54,
              ),
              const SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}
