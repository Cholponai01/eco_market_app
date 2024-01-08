import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/config/config.dart';
import 'package:eco_market_app/features/search/presentation/widgets/custom_button_widget.dart';
import 'package:eco_market_app/features/search/presentation/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ProductsName> products = List.generate(7, (index) => ProductsName());
  List<ProductDisplay> productsDisplay = [];
  List<ShoppingCartItem> cartItems =
      List.generate(8, (index) => ShoppingCartItem());
  bool isAdded = false;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    productsDisplay = [
      ProductDisplay(
        image: "assets/images/products/apple.png",
        title: "Яблоко красная радуга сладкая",
        price: "56 c",
      ),
      ProductDisplay(
        image: "assets/images/products/orange.png",
        title: "Апельсины сладкий пакистанский",
        price: "86 c",
      ),
      ProductDisplay(
        image: "assets/images/products/pitaya.png",
        title: "Драконий фрукт",
        price: "340 c",
      ),
      ProductDisplay(
        image: "assets/images/products/apple.png",
        title: "Яблоко золотая радуга",
        price: "56 c",
      ),
      ProductDisplay(
        image: "assets/images/products/pitaya.png",
        title: "Драконий фрукт",
        price: "340 c",
      ),
      ProductDisplay(
        image: "assets/images/products/apple.png",
        title: "Яблоко золотая радуга",
        price: "56 c",
      ),
      ProductDisplay(
        image: "assets/images/products/green_apple.png",
        title: "Яблоко красная радуга сладкая",
        price: "56 c",
      ),
      ProductDisplay(
        image: "assets/images/products/apple.png",
        title: "Яблоко красная радуга сладкая",
        price: "56 c",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Продукты",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 16, top: 12, left: 16),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10.0),
                    constraints: const BoxConstraints(
                      maxHeight: 40,
                    ),
                    filled: true,
                    fillColor: AppColors.lightGrey,
                    hintText: "Быстрый поиск",
                    hintStyle: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    prefixIcon: const Icon(Icons.search, color: AppColors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide.none,
                    )),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 38,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      ProductsName product = products[index];
                      return GestureDetector(
                          onTap: () => _onTapSellected(index),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: _currentIndex == index
                                  ? AppColors.green
                                  : AppColors.white,
                              border: Border.all(
                                color: _currentIndex == index
                                    ? AppColors.white
                                    : AppColors.grey,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                              child: Text(
                                product.productsName[index],
                                style: TextStyle(
                                  color: _currentIndex == index
                                      ? AppColors.white
                                      : AppColors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ));
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 8,
                        ),
                    itemCount: 7),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 11.0,
                      mainAxisSpacing: 11.0,
                      mainAxisExtent: 284,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      ShoppingCartItem item = cartItems[index];
                      return GestureDetector(
                        onTap: () {},
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: AppColors.lightGrey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      productsDisplay[index].image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    productsDisplay[index].title,
                                    style: const TextStyle(
                                      color: AppColors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Text(
                                    productsDisplay[index].price,
                                    style: const TextStyle(
                                      color: AppColors.green,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  CustomButtonWidget(
                                      text: "Добавить",
                                      height: 32,
                                      onPressed: () {
                                        showFruit(context, item);
                                      })
                                ]),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }

  void _onTapSellected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  showFruit(BuildContext context, ShoppingCartItem item) =>
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => StatefulBuilder(
              builder: (context, StateSetter setState) => Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 16, right: 16, bottom: 24),
                    child: Wrap(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                                "assets/images/products/apple.png",
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
}

class ProductsName {
  var productsName = <String>[
    'Все',
    'Фрукты',
    'Сухофрукты',
    'Овощи',
    'Зелень',
    'Чай кофе',
    'Молочные продукты',
  ];
}

class ProductDisplay {
  final String image;
  final String title;
  final String price;

  ProductDisplay(
      {required this.image, required this.title, required this.price});
}

class ShoppingCartItem {
  int _counter = 0;
  void incrementCounter() {
    _counter++;
  }

  decrementCounter() {
    if (_counter > 0) _counter--;
  }

  int getCounter() {
    return _counter;
  }
}
