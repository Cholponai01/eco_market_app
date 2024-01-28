import 'package:eco_market_app/config/theme/app_colors.dart';
import 'package:eco_market_app/features/cart/domain/entities/order_entity.dart';
import 'package:eco_market_app/features/history/presentation/pages/history/order_page.dart';
import 'package:eco_market_app/features/history/presentation/widgets/text_price_widget.dart';
import 'package:eco_market_app/features/search/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

bottomSheetOrderHistory(BuildContext context, OrderEntity orderEntity) =>
    showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        showDragHandle: true,
        backgroundColor: AppColors.green,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) => StatefulBuilder(
            builder: (context, StateSetter setState) => SingleChildScrollView(
                  child: Wrap(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 220,
                        child: Column(
                          children: [
                            text('Заказ №${orderEntity.orderNumber}'),
                            const SizedBox(
                              height: 4,
                            ),
                            Image.asset('assets/images/history/check.png'),
                            const SizedBox(
                              height: 12,
                            ),
                            text('Оформлен ${orderEntity.createdAt}'),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${orderEntity.totalAmount}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            text('Доставка ${orderEntity.deliveryCost} с'),
                          ],
                        ),
                      ),
                      DecoratedBox(
                        decoration: const BoxDecoration(color: AppColors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 16, left: 16),
                          child: Column(
                            children: [
                              for (int i = 1; i < 4; i++)
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OrderPage())),
                                  child: Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    height: 70,
                                    width: double.infinity,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xffF8F8F8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Row(
                                          children: [
                                            const CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/images/history/small_apple.png'),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Яблоко золотая радуга',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF1E1E1E),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.17,
                                                      ),
                                                      const Text('56 с',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF75DB1B),
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          )),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      priceText(
                                                          'Цена 56 с за штук'),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.39,
                                                      ),
                                                      priceText('1 шт')
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              const SizedBox(
                                height: 42,
                              ),
                              CustomButtonWidget(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                text: 'Закрыть',
                                height: 54,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )));
