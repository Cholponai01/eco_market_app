import 'package:eco_market_app/config/theme/app_colors.dart';
import 'package:eco_market_app/features/search/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<void> orderDialog(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(16),
          backgroundColor: AppColors.white,
          content: SizedBox(
            height: 400,
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/svg/cart/bag.svg',
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 28,
                ),
                const Text(
                  'Заказ может быть при покупке свыше 300 с',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomButtonWidget(
                  onPressed: () {},
                  text: 'Закрыть',
                  height: 54,
                )
              ],
            ),
          ),
        );
      });
}
