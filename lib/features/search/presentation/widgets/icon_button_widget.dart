import 'package:eco_market_app/config/config.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key, this.icon, this.onTap});
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 32,
        height: 32,
        child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.green),
            child: Icon(
              icon,
              size: 24,
              color: AppColors.white,
            )),
      ),
    );
  }
}
