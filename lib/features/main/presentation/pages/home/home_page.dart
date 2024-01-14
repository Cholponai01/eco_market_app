import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/config/config.dart';
import 'package:eco_market_app/features/search/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GridMenuItem> gridMenuItems = [];

  @override
  void initState() {
    super.initState();
    gridMenuItems = [
      GridMenuItem(
        image: "assets/images/main/fruits.png",
        title: "Фрукты",
        onTap: () => context.pushRoute(const SearchRoute()),
      ),
      GridMenuItem(
        image: "assets/images/main/dried_fruits.png",
        title: "Сухофрукты",
        onTap: () {},
      ),
      GridMenuItem(
        image: "assets/images/main/vegetables.png",
        title: "Овощи",
        onTap: () {},
      ),
      GridMenuItem(
        image: "assets/images/main/greenery.png",
        title: "Зелень",
        onTap: () {},
      ),
      GridMenuItem(
        image: "assets/images/main/tea_coffee.png",
        title: "Чай и кофе",
        onTap: () {},
      ),
      GridMenuItem(
        image: "assets/images/main/dairy.png",
        title: "Молочные продукты",
        onTap: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("Эко Маркет",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, top: 18, left: 16),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 185.0,
            crossAxisCount: 2,
            mainAxisSpacing: 11.0,
            crossAxisSpacing: 11.0,
          ),
          itemCount: gridMenuItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: gridMenuItems[index].onTap,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(gridMenuItems[index].image),
                      fit: BoxFit.cover),
                ),
                child: Stack(children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.black.withOpacity(0),
                          AppColors.black
                        ],
                        begin: const Alignment(0.00, -1.00),
                        end: const Alignment(0.00, 1.8),
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          gridMenuItems[index].title,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                              height: 0),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _showNoConnectionDialog(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: const EdgeInsets.all(16),
              backgroundColor: AppColors.white,
              content: SizedBox(
                  height: 458,
                  child: Column(children: [
                    const Image(
                      image:
                          AssetImage('assets/images/network/no_connection.png'),
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Отсутствует интернет  соединение',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Попробуйте подключить мобильный интернет',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFABABAD),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomButtonWidget(
                      onPressed: () => context.popRoute(),
                      text: 'Ok',
                      height: 54,
                    )
                  ])));
        });
  }
}

class GridMenuItem {
  final String image;
  final String title;
  final VoidCallback onTap;

  GridMenuItem({required this.image, required this.title, required this.onTap});
}
