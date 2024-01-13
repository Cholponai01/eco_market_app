import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/features/info/presentation/widgets/social_connect_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'assets/images/network/info.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Эко Маркет',
                      style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Фрукты, овощи, зелень, сухофрукты а так же сделанные из натуральных ЭКО продуктов (варенье, салаты, соления, компоты и т.д.) можете заказать удобно, качественно и по доступной цене. Готовы сотрудничать взаимовыгодно с магазинами. Наши цены как на рынке. Мы заинтересованы в экономии ваших денег и времени. Стоимость доставки 150 сом и ещё добавлен для окраину города. При отказе подтвержденного заказа более  2-х раз Клиент заносится в чёрный список!!',
                      style: TextStyle(
                        color: Color(0xFFABABAD),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 33,
                      width: double.infinity,
                    ),
                    SocialConnectButtonWidget(
                      onPressed: () {},
                      text: 'Позвонить',
                      child: SvgPicture.asset('assets/svg/icons/phone.svg'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SocialConnectButtonWidget(
                      onPressed: () {},
                      text: 'WhatsApp',
                      child: SvgPicture.asset('assets/svg/icons/whatsapp.svg'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SocialConnectButtonWidget(
                      onPressed: () {},
                      text: 'Instagram',
                      child: SvgPicture.asset('assets/svg/icons/instagram.svg'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
