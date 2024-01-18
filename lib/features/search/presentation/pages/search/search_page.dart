import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/config/config.dart';
import 'package:eco_market_app/features/main/presentation/widgets/shopping_cart_item.dart';
import 'package:eco_market_app/features/search/presentation/widgets/custom_button_widget.dart';
import 'package:eco_market_app/features/search/presentation/widgets/products_name.dart';
import 'package:eco_market_app/features/search/presentation/widgets/show_fruit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        child: SafeArea(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10.0),
                    constraints: const BoxConstraints(
                      maxHeight: 46,
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
                        borderSide: BorderSide.none)),
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
                                        showFruit(context, item, isAdded);
                                      })
                                ]),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: 168,
          height: 48,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/images/svg/main/bag.svg",
                      // ignore: deprecated_member_use
                      color: AppColors.white,
                    ),
                    const Text(
                      "Корзина 396 с",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSellected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class ProductDisplay {
  final String image;
  final String title;
  final String price;

  ProductDisplay(
      {required this.image, required this.title, required this.price});
}
