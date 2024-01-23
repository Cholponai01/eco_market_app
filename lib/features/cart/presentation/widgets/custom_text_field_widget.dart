import 'package:eco_market_app/config/config.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: AppColors.grey,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.grey)));
  }
}
