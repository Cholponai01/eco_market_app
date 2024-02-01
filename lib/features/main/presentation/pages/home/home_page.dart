import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/config/config.dart';
import 'package:eco_market_app/features/main/domain/entities/category_entity.dart';
import 'package:eco_market_app/features/main/presentation/cubit/cubit/main_screen_cubit.dart';
import 'package:eco_market_app/features/search/presentation/pages/pages.dart';
import 'package:eco_market_app/features/search/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryEntity> data = [];
  List<String> fruits = [];

  @override
  void initState() {
    super.initState();
    context.read<MainScreenCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("Эко Маркет",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))),
      ),
      body: BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
          if (state is MainScreenLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MainScreenLoaded) {
            data = state.categories;
            for (var item in data) {
              fruits.add(item.name!);
            }
          }
          return Padding(
            padding: const EdgeInsets.only(right: 16, top: 18, left: 16),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 185.0,
                crossAxisCount: 2,
                mainAxisSpacing: 11.0,
                crossAxisSpacing: 11.0,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchPage(
                                  id: index + 1,
                                  fruits: fruits,
                                )));
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(data[index].image.toString()),
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
                              data[index].name.toString(),
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
          );
        },
      ),
    );
  }

  showNoConnectionDialog(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(16),
            backgroundColor: AppColors.white,
            content: SizedBox(
              height: 458,
              child: Column(
                children: [
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
                  ),
                ],
              ),
            ),
          );
        });
  }
}
