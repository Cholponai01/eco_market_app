import 'package:eco_market_app/config/theme/app_colors.dart';
import 'package:eco_market_app/features/main/presentation/widgets/shopping_cart_item.dart';
import 'package:eco_market_app/features/search/presentation/widgets/custom_button_widget.dart';
import 'package:eco_market_app/features/search/presentation/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';

showFruit(BuildContext context, ShoppingCartItem item, bool isAdded) =>
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        builder: (BuildContext context) => StatefulBuilder(
            builder: (context, StateSetter setState) => Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 16, right: 16, bottom: 24),
                  child: Wrap(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset("assets/images/products/apple.png",
                              fit: BoxFit.cover),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Яблоко красная радуга сладкая",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "56 c шт",
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Cочный плод яблони, который употребляется в пищу в свежем и запеченном виде, служит сырьём в кулинарии и для приготовления напитков.",
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 24),
                        isAdded
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "112 c",
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Row(
                                    children: [
                                      IconButtonWidget(
                                        icon: Icons.remove,
                                        onTap: () {
                                          setState(() {
                                            item.decrementCounter();
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 44),
                                      Text(item.getCounter().toString(),
                                          style: const TextStyle(
                                              color: AppColors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(width: 44),
                                      IconButtonWidget(
                                          icon: Icons.add,
                                          onTap: () {
                                            item.incrementCounter();
                                          })
                                    ],
                                  )
                                ],
                              )
                            : CustomButtonWidget(
                                text: "Добавить",
                                height: 54,
                                onPressed: () {
                                  setState(() {
                                    isAdded = true;
                                  });
                                })
                      ],
                    )
                  ]),
                )));
