import 'package:eco_market_app/config/theme/app_colors.dart';
import 'package:eco_market_app/features/cart/presentation/widgets/custom_text_field_widget.dart';
import 'package:eco_market_app/features/search/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class PlaceanOrderPage extends StatefulWidget {
  const PlaceanOrderPage({super.key});

  @override
  State<PlaceanOrderPage> createState() => _PlaceanOrderPageState();
}

class _PlaceanOrderPageState extends State<PlaceanOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.black),
        title: const Text(
          'Оформление заказа',
          style: TextStyle(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CustomTextFieldWidget(
                hintText: 'Номер телефона',
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextFieldWidget(
                hintText: 'Адрес',
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextFieldWidget(
                hintText: 'Ориентир',
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextFieldWidget(
                hintText: 'Комментарии',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              const Text(
                'Сумма Заказа 340 с',
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButtonWidget(
                onPressed: () {},
                height: 54,
                text: 'Заказать доставку',
              )
            ],
          ),
        ),
      ),
    );
  }
}
