import 'package:eco_market_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

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
    pageController = PageController(initialPage: _currentIndex, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              _currentIndex = value;
              setState(() {});
            },
            children: []),
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
              BottomNavigationBarItem(icon: icons[0], label: "Главная"),
              BottomNavigationBarItem(icon: icons[1], label: "Корзина"),
              BottomNavigationBarItem(icon: icons[2], label: "Профиль"),
              BottomNavigationBarItem(icon: icons[3], label: "Избранное"),
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
      duration: const Duration(milliseconds: 10),
      curve: Curves.bounceIn,
    );
  }
}
