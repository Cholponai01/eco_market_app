import 'package:auto_route/auto_route.dart';
import 'package:eco_market_app/config/theme/app_colors.dart';
import 'package:eco_market_app/features/cart/presentation/pages/pages.dart';
import 'package:eco_market_app/features/history/presentation/pages/history/history_page.dart';
import 'package:eco_market_app/features/info/presentation/pages/info/info_page.dart';
import 'package:eco_market_app/features/main/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: _currentIndex,
      keepPage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [],
        child: SafeArea(
          child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                _currentIndex = value;
                setState(() {});
              },
              children: const [
                HomePage(),
                CartPage(),
                HistoryPage(),
                InfoPage(),
              ]),
        ),
      ),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.6,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              height: 1.6,
            ),
            selectedItemColor: AppColors.green,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/images/svg/main/home.svg",
                    width: 28,
                    height: 28,
                    // ignore: deprecated_member_use
                    color:
                        _currentIndex == 0 ? AppColors.green : AppColors.grey,
                  ),
                  label: "Главная"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/images/svg/main/bag.svg",
                    width: 28,
                    height: 28,
                    // ignore: deprecated_member_use
                    color:
                        _currentIndex == 0 ? AppColors.green : AppColors.grey,
                  ),
                  label: "Корзина"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/images/svg/main/clock.svg",
                    width: 28,
                    height: 28,
                    // ignore: deprecated_member_use
                    color:
                        _currentIndex == 0 ? AppColors.green : AppColors.grey,
                  ),
                  label: "История"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/images/svg/main/info.svg",
                    width: 28,
                    height: 28,
                    // ignore: deprecated_member_use
                    color:
                        _currentIndex == 0 ? AppColors.green : AppColors.grey,
                  ),
                  label: "Инфо"),
            ],
          )),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 7),
      curve: Curves.bounceIn,
    );
  }
}
