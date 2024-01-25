import 'package:eco_market_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

Widget text(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: AppColors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget priceText(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: AppColors.grey,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  );
}
