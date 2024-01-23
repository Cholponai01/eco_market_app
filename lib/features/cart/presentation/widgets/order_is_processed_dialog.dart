import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/config/routes/app_router.dart';
import 'package:eco_market_app/config/theme/app_colors.dart';
import 'package:eco_market_app/features/search/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<void> orderIsProcessedDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(16),
        backgroundColor: AppColors.white,
        content: SizedBox(
          height: 430,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/images/svg/cart/bag2.svg',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Заказ №343565657 оформлен',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Дата и время 07.07.2023 12:46',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButtonWidget(
                onPressed: () => context.router.pushAndPopUntil(
                  const MainRoute(),
                  predicate: (fu) => false,
                ),
                text: 'Перейти в магазин',
                height: 54,
              )
            ],
          ),
        ),
      );
    },
  );
}
