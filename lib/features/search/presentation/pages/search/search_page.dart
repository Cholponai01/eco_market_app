import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_market_app/config/config.dart';
import 'package:eco_market_app/features/main/presentation/widgets/shopping_cart_item.dart';
import 'package:eco_market_app/features/search/domain/entities/product_entity.dart';
import 'package:eco_market_app/features/search/presentation/cubit/cubit/search_screen_cubit.dart';
import 'package:eco_market_app/features/search/presentation/widgets/custom_button_widget.dart';
import 'package:eco_market_app/features/search/presentation/widgets/show_fruit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  final int id;
  final List<String> fruits;
  const SearchPage({super.key, required this.id, required this.fruits});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ShoppingCartItem> cartItems =
      List.generate(8, (index) => ShoppingCartItem());
  List<String> fruits = [];
  bool isAdded = false;
  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = widget.id;
    fruits = ['Все', ...widget.fruits];
    context
        .read<SearchScreenCubit>()
        .getProducts(productType: fruits[_currentIndex]);
    super.initState();
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
                onChanged: (value) {
                  if (_currentIndex != 0) {
                    context.read<SearchScreenCubit>().getProducts(
                        search: value, productType: fruits[_currentIndex]);
                  } else {
                    context
                        .read<SearchScreenCubit>()
                        .getProducts(search: value);
                  }
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10.0),
                    constraints: const BoxConstraints(
                      maxHeight: 46,
                    ),
                    filled: true,
                    fillColor: AppColors.lightGrey,
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
                      // ProductsName product = products[index];
                      return GestureDetector(
                          onTap: () {
                            _onTapSellected(index);
                            if (index == 0) {
                              context.read<SearchScreenCubit>().getProducts();
                            } else {
                              context
                                  .read<SearchScreenCubit>()
                                  .getProducts(productType: fruits[index]);
                            }
                          },
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
                                fruits[index],
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
                    itemCount: fruits.length),
              ),
              const SizedBox(height: 20),
              BlocBuilder<SearchScreenCubit, SearchScreenState>(
                builder: (context, state) {
                  List<ProductEntity> data = [];
                  if (state is SearchScreenLoading) {
                    return const Expanded(child: CircularProgressIndicator());
                  } else if (state is SearchScreenLoaded) {
                    data = state.products;
                  }
                  return data.isEmpty
                      ? Column(
                          children: [
                            SvgPicture.asset("assets/images/svg/cart/bag.svg"),
                            const Text(
                              "Ничего не найдено",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkGrey,
                              ),
                            )
                          ],
                        )
                      : Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 11.0,
                                mainAxisSpacing: 11.0,
                                mainAxisExtent: 284,
                              ),
                              itemCount: data.length,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: CachedNetworkImage(
                                                imageUrl: data[index]
                                                    .image
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                height: 96,
                                                width: 158,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              data[index].title.toString(),
                                              style: const TextStyle(
                                                color: AppColors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            Text(
                                              ' ${data[index].price} с',
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
                                                  showFruit(context, item,
                                                      isAdded, data[index]);
                                                })
                                          ]),
                                    ),
                                  ),
                                );
                              }),
                        );
                },
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
